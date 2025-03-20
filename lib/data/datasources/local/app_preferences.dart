import 'package:flutter/material.dart';

abstract class AppPreferences {
  Future<void> saveLocale(String val);
  Future<String?> get locale;

  Future<void> saveLanguageByCode(String key, String val);
  Future<String> getLanguageByCode(String langCode);

  Future<void> saveThemeMode(ThemeMode val);
  Future<ThemeMode> get themeMode;
}
