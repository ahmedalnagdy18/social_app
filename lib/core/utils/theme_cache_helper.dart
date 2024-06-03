import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  static const String _themeKey = "theme";

  Future<void> cacheTheme(bool isDarkMode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_themeKey, isDarkMode);
  }

  Future<bool> getCachedTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_themeKey) ?? false;
  }
}
