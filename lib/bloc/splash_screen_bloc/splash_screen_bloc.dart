import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/i_auth.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'splash_screen_bloc.freezed.dart';
part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final IAuth authService;
  final ICloudDataService cloudDataService;

  SplashScreenBloc(this.authService, this.cloudDataService);
  @override
  SplashScreenState get initialState => const SplashScreenState.initial();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    yield* event.when(
      requestAuthCheck: () async* {
        final userOrFailure =
            await authService.getSignedInUser(const Params.noParams());
        yield* userOrFailure.fold((_) async* {
          yield const SplashScreenState.unauthenticated();
        }, _logUserIn);
      },
      signOut: (String uid) async* {
        await authService.signOut(const Params.noParams());
        await cloudDataService.updateUserData(Params.map({
          "uid": uid,
          "data": {"token": ""}
        }));
        yield const SplashScreenState.unauthenticated();
      },
      authenticate: _logUserIn,
    );
  }

  Stream<SplashScreenState> _logUserIn(User user) async* {
    yield SplashScreenState.authenticated(user);
  }
}
