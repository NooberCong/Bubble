import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
      body: SingleChildScrollView(
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
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/images/top_deco.png",
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/bottom_deco.png",
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Login\n",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    autovalidate: _autoValidate,
                    key: _formKey,
                    child: Theme(
                      data:
                          Theme.of(context).copyWith(primaryColor: Colors.pink),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                labelText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                fillColor: Colors.blue.withOpacity(.3)),
                            controller: _emailController,
                            validator: (text) => text.isEmpty
                                ? "This field must not be empty"
                                : null,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue.withOpacity(.3),
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                ),
                              ),
                              validator: (text) => text.isEmpty
                                  ? "This field must not be empty"
                                  : null,
                              controller: _passwordController),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: RaisedButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    color: Colors.pink,
                    onPressed: () {
                      enableAutoValidate();
                      if (_formKey.currentState.validate()) {
                        _dismissKeyboard(context);
                        tryLogin(context);
                        disableAutoValidate();
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: const Text("Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                      width: 40,
                    ),
                    Flexible(
                        child: Container(
                      height: 1,
                      color: Colors.grey,
                    )),
                    const Text("OR", style: TextStyle(color: Colors.grey)),
                    Flexible(
                        child: Container(
                      height: 1,
                      color: Colors.grey,
                    )),
                    const SizedBox(
                      height: 30,
                      width: 40,
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: RaisedButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.blue.shade400
                        : Colors.white,
                    onPressed: () {
                      _dismissKeyboard(context);
                      tryGoogleLogin(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Continue with Google\t",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.white
                                      : Colors.red,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15)),
                          SvgPicture.asset(
                            "assets/images/google.svg",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Dont have an account?\t\t",
                    ),
                    GestureDetector(
                      onTap: () => _navigateToSignUpScreen(context),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: const Text(
                          "create one",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _buildLoading(),
          ],
        ),
      ),
    );
  }

  void _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
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

  void _showErrorDialog(BuildContext context, String errorMsg) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.SCALE,
      title: "Log in failed",
      desc: errorMsg,
      btnOkText: "Try again",
      btnCancelColor: Colors.blue,
      btnCancelText: "Create account",
      btnCancelOnPress: () {
        _navigateToSignUpScreen(context);
      },
      btnOkOnPress: () {},
      headerAnimationLoop: false,
      useRootNavigator: true,
    ).show();
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

  Widget _buildLoading() {
    if (_isLoading) {
      return Container(
        color: Colors.black.withOpacity(.75),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Authenticating\n",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            CircularProgressIndicator(),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
