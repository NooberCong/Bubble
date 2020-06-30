import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/login_screen_bloc/login_screen_bloc.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FA),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocProvider(
            create: (_) => getIt<LoginScreenBloc>(), child: const LoginForm()),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _autoValidate = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenBloc, LoginScreenState>(
      listener: (context, state) {
        setState(() {
          _isLoading =
              state.maybeWhen(loading: () => true, orElse: () => false);
        });
        state.maybeWhen(
            error: (errorMsg) => _showErrorDialog(context, errorMsg),
            success: (user) => _navigateToHomeScreen(context, user),
            orElse: () {});
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          SvgPicture.asset(
            "assets/images/icon.svg",
            height: 150,
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              autovalidate: _autoValidate,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                    controller: _emailController,
                    validator: (text) =>
                        text.isEmpty ? "This field must not be empty" : null,
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.vpn_key,
                        ),
                      ),
                      validator: (text) =>
                          text.isEmpty ? "This field must not be empty" : null,
                      controller: _passwordController),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          RaisedButton(
            color: _isLoading ? Colors.grey : Theme.of(context).primaryColor,
            onPressed: () {
              enableAutoValidate();
              if (_formKey.currentState.validate()) {
                tryLogin(context);
                disableAutoValidate();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(_isLoading ? "Authenticating..." : "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 40,
              ),
              Flexible(
                  child: Container(
                height: 1,
                color: Colors.grey,
              )),
              Text("OR", style: TextStyle(color: Colors.grey)),
              Flexible(
                  child: Container(
                height: 1,
                color: Colors.grey,
              )),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          RaisedButton(
            color: Colors.white,
            onPressed: () => tryGoogleLogin(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width - 100,
              child: Text("Continue with Google",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red)),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Dont have an account? ",
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: () => _navigateToSignUpScreen(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: const Text(
                    " create one",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void tryGoogleLogin(BuildContext context) {
    context
        .bloc<LoginScreenBloc>()
        .add(const LoginScreenEvent.loginWithGoogle());
  }

  void enableAutoValidate() {
    setState(() {
      _autoValidate = true;
    });
  }

  void tryLogin(BuildContext context) {
    context.bloc<LoginScreenBloc>().add(
        LoginScreenEvent.loginWithEmailAndPassword(
            _emailController.text, _passwordController.text));
    _passwordController.clear();
  }

  void disableAutoValidate() {
    setState(() {
      _autoValidate = false;
    });
  }

  Future _showErrorDialog(BuildContext context, String errorMsg) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (dialogContext) => AlertDialog(
              backgroundColor: Colors.white,
              title: const Text("Login failed"),
              content: Text(errorMsg),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    _navigateToSignUpScreen(context);
                  },
                  child: const Text("Create new account"),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text("Try again"),
                  //TODO Exit modal
                ),
              ],
            ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _navigateToSignUpScreen(BuildContext context) {
    //dismiss keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    ExtendedNavigator.of(context).pushNamed(Routes.signUpScreen);
  }

  void _navigateToHomeScreen(BuildContext context, User user) {
    context.bloc<SplashScreenBloc>().add(SplashScreenEvent.authenticate(user));
  }
}
