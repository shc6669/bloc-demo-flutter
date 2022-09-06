import 'dart:convert';
import 'package:bloc_flutter/settings/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;
  static const String keySelectedTheme = 'key_selected_theme';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveTheme(AppTheme selectedTheme) async {
    if (null == selectedTheme) {
      selectedTheme = AppTheme.lightTheme;
    }

    String theme = jsonEncode(selectedTheme.toString());
    preferences?.setString(keySelectedTheme, theme);
  }

  static AppTheme? getTheme() {
    final String? theme = preferences?.getString(keySelectedTheme);
    if (null == theme) {
      return AppTheme.lightTheme;
    }
    return getThemeFromString(jsonDecode(theme));
  }

  static AppTheme? getThemeFromString(String themeString) {
    for (AppTheme theme in AppTheme.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }
}
