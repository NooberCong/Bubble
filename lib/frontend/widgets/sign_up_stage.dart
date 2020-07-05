import 'package:bubble/bloc/sign_up_bloc/sign_up_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bubble/frontend/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignUpStage extends StatefulWidget {
  final SignUpScreenState state;
  const SignUpStage({Key key, this.state}) : super(key: key);

  @override
  _SignUpStageState createState() => _SignUpStageState();
}

class _SignUpStageState extends State<SignUpStage> {
  bool _isLoading = false;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Update initial value
    _controller.text = _getInitialValue(widget.state);
    _controller.selection = TextSelection(
        baseOffset: _controller.text.length,
        extentOffset: _controller.text.length);
    //set loading to false
    return BlocListener<SignUpScreenBloc, SignUpScreenState>(
      listener: (BuildContext context, SignUpScreenState state) {
        setState(() {
          _isLoading =
              state.maybeWhen(loading: () => true, orElse: () => false);
        });
      },
      child: WillPopScope(
        onWillPop: () => _getPreviousState(context),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _getQuestion(widget.state),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                child: TextFormField(
                  controller: _controller,
                  obscureText: _shouldObscureText(widget.state),
                  decoration: InputDecoration(
                      helperText: _getErrorMessage(widget.state),
                      helperMaxLines: 3,
                      helperStyle: const TextStyle(color: Colors.red)),
                ),
              ),
              RaisedButton(
                onPressed: () => nextScreen(context, _controller.text),
                color: _isLoading ? Colors.grey : Colors.pink,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    _isLoading ? "Processing..." : "Next",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _getPreviousState(BuildContext context) {
    final hasPrevious = context
        .bloc<SignUpScreenBloc>()
        .state
        .maybeWhen(name: (_, __) => false, orElse: () => true);
    if (hasPrevious) {
      context
          .bloc<SignUpScreenBloc>()
          .add(const SignUpScreenEvent.requestLastState());
      return Future.value(false);
    } else {
      return Future.value(showCancelDialogue(context));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getInitialValue(SignUpScreenState state) {
    return state.maybeMap(
      name: (s) => s.initialValue,
      bio: (s) => s.initialValue,
      email: (s) => s.initialValue,
      password: (s) => s.initialValue,
      orElse: () => _controller.text,
    );
  }

  String _getErrorMessage(SignUpScreenState state) {
    return state.maybeMap(
      name: (s) => s.errorMsgOrEmpty,
      bio: (s) => s.errorMsgOrEmpty,
      email: (s) => s.errorMsgOrEmpty,
      password: (s) => s.errorMsgOrEmpty,
      orElse: () => "",
    );
  }

  String _getQuestion(SignUpScreenState state) {
    return state.maybeMap(
      name: (s) => "What's your name?",
      bio: (s) => "Tell others something about you",
      email: (s) => "Enter your email address",
      password: (s) => "Enter your password",
      orElse: () => "",
    );
  }

  bool _shouldObscureText(SignUpScreenState state) {
    return state.maybeWhen(password: (_, __) => true, orElse: () => false);
  }
}
