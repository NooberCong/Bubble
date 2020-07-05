import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/backend/auth_service.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/i_auth.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'settings_screen_event.dart';
part 'settings_screen_state.dart';
part 'settings_screen_bloc.freezed.dart';

@injectable
class SettingsScreenBloc
    extends Bloc<SettingsScreenEvent, SettingsScreenState> {
  final IAuth authService;
  final ICloudDataService cloudDataService;

  SettingsScreenBloc(this.authService, this.cloudDataService);
  @override
  SettingsScreenState get initialState => const SettingsScreenState.initial();

  @override
  Stream<SettingsScreenState> mapEventToState(
    SettingsScreenEvent event,
  ) async* {
    yield* event.when(
      editAvatar: (imagePath) async* {
        yield const SettingsScreenState.processing();
        final currentUser =
            await (authService as AuthService).getFirebaseUser();
        if (currentUser != null) {
          final updateResult =
              await cloudDataService.updateUserData(Params.map({
            "uid": currentUser.uid,
            //The photoUrl here is just fallback data in case update somehow fails,
            //it will later in the updateUserData function be replaced with the new image url
            "data": {"imageUrl": currentUser.photoUrl},
            "imagePath": imagePath
          }));
          yield* updateResult.fold((error) async* {
            yield SettingsScreenState.notify(error.message);
          }, (updatedData) async* {
            await currentUser.updateProfile(
                UserUpdateInfo()..photoUrl = updatedData["imageUrl"] as String);
            await currentUser.reload();
            yield const SettingsScreenState.notify(
                "Avatar updated successfully");
          });
        }
      },
      editBio: (uid, bio) async* {
        yield const SettingsScreenState.processing();
        final updateResult = await cloudDataService.updateUserData(Params.map({
          "uid": uid,
          "data": {"bio": bio},
        }));
        yield* updateResult.fold((error) async* {
          yield SettingsScreenState.notify(error.message);
        }, (_) async* {
          yield const SettingsScreenState.notify("Bio updated successfully");
        });
      },
      requestUserStream: (String uid) async* {
        final userDetailsStreamOrFailure =
            await cloudDataService.fetchUserDetailsStream(Params.id(uid));
        yield userDetailsStreamOrFailure.fold(
            (error) => const SettingsScreenState.notify(
                "Could not load cloud user details"),
            (stream) => SettingsScreenState.userStreamLoaded(stream));
      },
    );
  }
}
