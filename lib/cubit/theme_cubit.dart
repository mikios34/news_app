import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeMode initialTheme) : super(ThemeState(initialTheme));
  void toggleTheme(ThemeMode newThemeMode) async {
    emit(ThemeState(newThemeMode));
    state.saveThemeMode();
  }

  static Future<ThemeMode> getInitialThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString('theme_mode');
    if (themeModeString == null) {
      return ThemeMode.light;
    } else {
      return ThemeMode.values.byName(themeModeString);
    }
  }
}
