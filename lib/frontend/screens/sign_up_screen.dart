import 'package:auto_route/auto_route.dart';
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
      backgroundColor: const Color(0xffF5F9FA),
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
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF5F9FA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _onArrowBack(context),
        ),
        title: const Text("Create an account",
            style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Future<void> _onArrowBack(BuildContext context) async {
    final shouldPop = await showCancelDialogue(context);
    if (shouldPop) ExtendedNavigator.of(context).pop();
  }
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

Future<bool> showCancelDialogue(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Do you want to cancel account registration?"),
            content: const Text("If you cancel now, all progress will be lost"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  "Continue",
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Cancel now",
                    style: TextStyle(color: Colors.pink)),
              )
            ],
          ));
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
