import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/backend/user_presence.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/i_auth.dart';
import 'package:bubble/notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'splash_screen_bloc.freezed.dart';
part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final IAuth authService;
  final NotificationManager notificationManager;
  final UserPresence userPresence;

  SplashScreenBloc(
      this.authService, this.notificationManager, this.userPresence);
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
        }, (user) async* {
          await notificationManager.initializeNotification(user.uid);
          await userPresence.initializePresence(user.uid);
          yield SplashScreenState.authenticated(user);
        });
      },
      signOut: () async* {
        yield const SplashScreenState.unauthenticated();
      },
    );
  }
}
