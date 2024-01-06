import 'package:flutter/material.dart';
import 'package:reusemart_app/services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;

  bool setDarkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set SetDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
