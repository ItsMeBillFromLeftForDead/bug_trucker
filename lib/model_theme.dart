import 'package:bug_trucker/DataTypes/color_schemes.dart';
import 'package:bug_trucker/theme_management.dart';
import 'package:flutter/material.dart';

class ModelTheme extends ChangeNotifier {
  late ColorSchemes _currentTheme;
  late MyThemePreferences _preferences;
  ColorSchemes get currentTheme => _currentTheme;

  ModelTheme._() {
    _currentTheme = ColorSchemes.blue;
    _preferences = MyThemePreferences();
    getPreferences();
  }

  static ModelTheme? _instance;

  factory ModelTheme() => _instance ??= ModelTheme._();

//Switching the themes
  void changeTheme(ColorSchemes value) {
    _currentTheme = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    String theme = await _preferences.getTheme();
    _currentTheme = ColorSchemes.values.firstWhere((e) => e.toString() == theme);
    notifyListeners();
  }
}