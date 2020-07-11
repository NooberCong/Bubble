import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/bloc/theme_bloc/theme_bloc.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionMenu extends StatefulWidget {
  final User user;
  const ActionMenu({Key key, this.user}) : super(key: key);

  @override
  _ActionMenuState createState() => _ActionMenuState();
}

class _ActionMenuState extends State<ActionMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/images/theme.svg",
                    width: 40,
                    height: 40,
                  ),
                  const Text("  App theme", style: TextStyle(fontSize: 16)),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: DropdownButton(
                  value: (context.bloc<ThemeBloc>().state as ThemeStateLoaded)
                      .mode,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.wb_sunny),
                          const Text("  Light"),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.brightness_2),
                          const Text("  Dark"),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.settings),
                          const Text("  System default"),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (ThemeMode value) {
                    context.bloc<ThemeBloc>().add(ThemeEvent.setTheme(value));
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
        FlatButton(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          onPressed: () => _onLogOut(context),
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/logout.svg",
                width: 40,
                height: 40,
              ),
              const Text("  Log out", style: TextStyle(fontSize: 16))
            ],
          ),
        ),
      ],
    );
  }

  void _onLogOut(BuildContext context) {
    ExtendedNavigator.of(context).popUntil((route) => route.isFirst);
    context
        .bloc<SplashScreenBloc>()
        .add(SplashScreenEvent.signOut(widget.user.uid));
  }
}
