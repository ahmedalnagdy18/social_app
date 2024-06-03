import 'package:flutter/material.dart';

enum AppTheme {
  light("light"),
  dark("dark");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.light: ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade200,
  ),
  AppTheme.dark: ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade800,
  ),
};
