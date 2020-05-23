import 'package:employement_app/textTheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:employement_app/pages/globals.dart' as global;

class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;
  bool get isDarkTheme => _darkTheme;

  SharedPreferences _sharedPreferences;

  ThemeProvider() {
    global.tema = bright;
    notifyListeners();
    initConf();
  }

  void initConf() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isDark = _sharedPreferences.getBool('theme') ?? false;
    if (isDark) {
      changeTheme();
    }
  }

  changeTheme() {
    _darkTheme = !_darkTheme;
    global.tema = _darkTheme ? dark : bright;
    _sharedPreferences.setBool('theme', _darkTheme);
    notifyListeners();
  }
}