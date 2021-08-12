import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.purple,
        );
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;

        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool vaule) {
    this._darkTheme = vaule;
    this._customTheme = false;

    if (vaule) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Colors.purple,
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool vaule) {
    this._customTheme = vaule;
    this._darkTheme = false;

    if (vaule) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Colors.purple,
      );
    }
    notifyListeners();
  }
}
