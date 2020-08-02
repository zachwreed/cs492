import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceTheme {
  static const String DARK_MODE = 'darkMode';
  static SharedPreferences _preferences;

  static Future initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool getDarkMode() {
    return _preferences.getBool(DARK_MODE) ?? false;
  }

  void setDarkMode(bool value) {
    _preferences.setBool(DARK_MODE, value);
  }
}
