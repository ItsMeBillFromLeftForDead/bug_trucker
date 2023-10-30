import 'package:bug_trucker/DataTypes/color_schemes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemePreferences {
  static const THEME_KEY = "theme_key";

  setTheme(ColorSchemes value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(THEME_KEY, value.toString());
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(THEME_KEY) ?? ColorSchemes.blue.toString();
  }
}