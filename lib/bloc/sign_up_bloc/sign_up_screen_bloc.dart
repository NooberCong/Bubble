import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bubble/bloc/sign_up_bloc/sign_up_state_manager.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/i_auth.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bubble/core/validators/sign_up_validator.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_up_screen_event.dart';
part 'sign_up_screen_state.dart';

part 'sign_up_screen_bloc.freezed.dart';

@injectable
class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpScreenBloc(this.authService, this.cloudDataService,
      {this.stateManager, this.validator});
  final SignUpStateManager stateManager;
  final SignUpValidator validator;
  final IAuth authService;
  final ICloudDataService cloudDataService;

  //User email and password are keep here for later registration

  @override
  SignUpScreenState get initialState => const SignUpScreenState.initial();

  @override
  Stream<SignUpScreenState> mapEventToState(
    SignUpScreenEvent event,
  ) async* {
    yield* event.when(requestNameScreen: () async* {
      // Start of the Sign Up stages, no validation needed
      yield const SignUpScreenState.name("", "");
    }, requestBioScreen: (name) async* {
      final inputIsValid = validator.validateName(name);
      if (inputIsValid) {
        stateManager.put(SignUpScreenState.name(name, ""));
        if (stateManager.hasNext) {
          yield stateManager.getNextState();
        } else {
          yield const SignUpScreenState.bio("", "");
        }
      } else {
        yield SignUpScreenState.name(name, validator.nameInputError);
      }
    }, requestEmailScreen: (bio) async* {
      final inputIsValid = validator.validateBio(bio);
      if (inputIsValid) {
        stateManager.put(SignUpScreenState.bio(bio, ""));
        if (stateManager.hasNext) {
          //If we are at a previous state, update the state instead of adding it to the list
          yield stateManager.getNextState();
        } else {
          yield const SignUpScreenState.email("", "");
        }
      } else {
        yield SignUpScreenState.bio(bio, validator.bioInputError);
      }
    }, requestPasswordScreen: (email) async* {
      final inputIsValid = validator.validateEmail(email);
      if (inputIsValid) {
        stateManager.put(SignUpScreenState.email(email, ""));
        if (stateManager.hasNext) {
          yield stateManager.getNextState();
        } else {
          yield const SignUpScreenState.password("", "");
        }
      } else {
        yield SignUpScreenState.email(email, validator.emailInputError);
      }
    }, requestLastState: () async* {
      yield stateManager.getPreviousState();
    }, requestFinishScreen: (String password) async* {
      final inputIsValid = validator.validatePassword(password);
      if (inputIsValid) {
        yield const SignUpScreenState.loading();
        final email =
            (stateManager.states[2] as _$SignUpScreenStateEmail).initialValue;
        final userOrFailure = await authService.signUpWithEmailAndPassword(
            Params.userCredentials(
                email, password, stateManager.parseDataFromStates()));
        yield userOrFailure.fold(
            (error) => SignUpScreenState.password(password, error.message),
            (user) => SignUpScreenState.finish(user));
      } else {
        yield SignUpScreenState.password(
            password, validator.passwordInputError);
      }
    });
  }
}
