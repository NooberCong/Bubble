import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences sharedPreferences;
  static String themePrefKey = "AppTheme";

  static Map<ThemeMode, String> themeToString = {
    ThemeMode.dark: "dark",
    ThemeMode.light: "light",
    ThemeMode.system: "system"
  };

  ThemeBloc(this.sharedPreferences);
  @override
  ThemeState get initialState => const ThemeState.initial();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    yield* event.when(
      setTheme: (themeMode) async* {
        await sharedPreferences.setString(
            themePrefKey, themeToString[themeMode]);
        yield ThemeState.loaded(themeMode);
      },
      restoreSavedTheme: () async* {
        final storedTheme = sharedPreferences.getString(themePrefKey);
        yield ThemeState.loaded(_themeFromString(storedTheme));
      },
    );
  }

  ThemeMode _themeFromString(String storedTheme) {
    if (storedTheme == null) {
      return ThemeMode.system;
    }
    return storedTheme == "dark" ? ThemeMode.dark : ThemeMode.light;
  }
}
