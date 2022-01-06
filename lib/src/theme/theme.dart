import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  final _darkThemeData = ThemeData.dark().copyWith(accentColor: Colors.pink);
  final _customThemeData = ThemeData.dark().copyWith(
    accentColor: Color(0xff48A0EB),
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Color(0xff16202B),
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
  );
  final _lightThemeData = ThemeData.light().copyWith();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //ligth
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = _lightThemeData;
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = _darkThemeData;
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = _customThemeData;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = _lightThemeData;
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    _customTheme = false;

    if (value) {
      _currentTheme = _darkThemeData;
    } else {
      _currentTheme = _lightThemeData;
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      _currentTheme = _customThemeData;
    } else {
      _currentTheme = _lightThemeData;
    }
    notifyListeners();
  }
}
