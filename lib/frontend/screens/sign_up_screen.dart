import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble/bloc/sign_up_bloc/sign_up_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/sign_up_finish.dart';
import 'package:bubble/frontend/widgets/sign_up_stage.dart';
import 'package:bubble/frontend/widgets/sign_up_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<SignUpScreenBloc>(),
        child: Column(
          children: const <Widget>[
            Divider(
              color: Colors.grey,
              thickness: .75,
            ),
            Expanded(child: SignUpForm()),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _onArrowBack(context),
        ),
        title: const Text(
          "Create an account",
        ),
      ),
    );
  }

  void _onArrowBack(BuildContext context) {
    showWarningDialog(context);
  }
}

void showWarningDialog(BuildContext context) {
  AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      title: "Cancel registration",
      desc: "If you cancel now, all progress will be lost",
      btnOkOnPress: () {},
      btnCancelText: "Cancel",
      btnOkText: "Continue",
      headerAnimationLoop: false,
      useRootNavigator: true,
      btnCancelOnPress: () {
        ExtendedNavigator.of(context).pop();
      }).show();
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
      condition: (_, state) =>
          state.maybeWhen(loading: () => false, orElse: () => true),
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const SignUpWelcome(),
          finish: (User user) => SignUpFinish(user: user),
          orElse: () => SignUpStage(
            state: state,
          ),
        );
      },
    );
  }
}

//Logic for navigating between screens during signing up
void nextScreen(BuildContext context, String lastInput) {
  final bloc = context.bloc<SignUpScreenBloc>();
  bloc.state.maybeWhen(
      initial: () => bloc.add(const SignUpScreenEvent.requestNameScreen()),
      name: (_, __) => bloc.add(SignUpScreenEvent.requestBioScreen(lastInput)),
      bio: (_, __) => bloc.add(SignUpScreenEvent.requestEmailScreen(lastInput)),
      email: (_, __) =>
          bloc.add(SignUpScreenEvent.requestPasswordScreen(lastInput)),
      password: (_, __) =>
          bloc.add(SignUpScreenEvent.requestFinishScreen(lastInput)),
      orElse: () => {});
}
