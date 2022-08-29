import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const _themeIndexKey = 'user_key';
  static const _userThemeModeKey = 'user_theme_mode_key';

  int? get themeIndex => _getFromDisk(_themeIndexKey);

  set themeIndex(int? value) => _saveToDisk(_themeIndexKey, value);

  ThemeMode? get userThemeMode {
    var userThemeString = _getFromDisk(_userThemeModeKey);
    if (userThemeString == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }

    if (userThemeString == ThemeMode.light.toString()) {
      return ThemeMode.light;
    }

    return null;
  }

  set userThemeMode(ThemeMode? value) {
    if (value == null) {
      _saveToDisk(_userThemeModeKey, value);
    } else {
      var userTheme = value.toString();
      _saveToDisk(_userThemeModeKey, userTheme);
    }
  }

  void clearPreferences() {
    _preferences.clear();
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  void _saveToDisk(String key, dynamic content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
