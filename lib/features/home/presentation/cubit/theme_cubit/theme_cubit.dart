// theme_cubit.dart
import 'package:firebase_app/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            themeData: appThemeData[AppTheme.light]!, isDarkTheme: false)) {
    _loadTheme();
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = state.isDarkTheme;
    if (isDark) {
      emit(ThemeState(
          themeData: appThemeData[AppTheme.light]!, isDarkTheme: false));
      prefs.setBool('isDark', false);
    } else {
      emit(ThemeState(
          themeData: appThemeData[AppTheme.dark]!, isDarkTheme: true));
      prefs.setBool('isDark', true);
    }
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? false;
    if (isDark) {
      emit(ThemeState(
          themeData: appThemeData[AppTheme.dark]!, isDarkTheme: true));
    } else {
      emit(ThemeState(
          themeData: appThemeData[AppTheme.light]!, isDarkTheme: false));
    }
  }
}
