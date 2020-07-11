import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bubble/core/failures/failure.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/i_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

part 'login_screen_bloc.freezed.dart';

@injectable
class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final IAuth _authService;

  LoginScreenBloc({@required IAuth authService}) : _authService = authService;
  @override
  LoginScreenState get initialState => const LoginScreenState.initial();

  @override
  Stream<LoginScreenState> mapEventToState(
    LoginScreenEvent event,
  ) async* {
    yield const LoginScreenState.loading();
    yield* event.when(
      loginWithEmailAndPassword: (email, password) async* {
        final authResult = await _authService.signInWithEmailAndPassword(
            Params.userCredentials(email, password, const {}));
        yield parseResult(authResult);
      },
      loginWithGoogle: () async* {
        final authResult =
            await _authService.signInWithGoogle(const Params.noParams());
        yield parseResult(authResult);
      },
    );
  }

  LoginScreenState parseResult(Either<AuthFailure, User> authResult) {
    return authResult.fold((error) => LoginScreenState.error(error.message),
        (user) => LoginScreenState.success(user));
  }
}
