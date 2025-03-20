import 'package:calendar_app/data/datasources/local/shared_prefs_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPrefsManager prefsManager;
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    prefsManager = SharedPrefsManager(mockPrefs);
  });

  group('SharedPrefsManager', () {
    test('saveLocale should save the locale', () async {
      when(() => mockPrefs.setString('locale', 'en'))
          .thenAnswer((_) async => true);

      await prefsManager.saveLocale('en');

      verify(() => mockPrefs.setString('locale', 'en')).called(1);
    });

    test('locale should return stored locale', () async {
      when(() => mockPrefs.getString('locale')).thenReturn('en');

      final result = await prefsManager.locale;

      expect(result, 'en');
      verify(() => mockPrefs.getString('locale')).called(1);
    });

    test('locale should return null if no locale is set', () async {
      when(() => mockPrefs.getString('locale')).thenReturn(null);

      final result = await prefsManager.locale;

      expect(result, isNull);
      verify(() => mockPrefs.getString('locale')).called(1);
    });

    test('saveThemeMode should save theme mode', () async {
      when(() => mockPrefs.setString('themeMode', ThemeMode.dark.toString()))
          .thenAnswer((_) async => true);

      await prefsManager.saveThemeMode(ThemeMode.dark);

      verify(() => mockPrefs.setString('themeMode', ThemeMode.dark.toString()))
          .called(1);
    });

    test('themeMode should return saved theme mode', () async {
      when(() => mockPrefs.getString('themeMode'))
          .thenReturn(ThemeMode.dark.toString());

      final result = await prefsManager.themeMode;

      expect(result, ThemeMode.dark);
      verify(() => mockPrefs.getString('themeMode')).called(1);
    });

    test('themeMode should return system mode for invalid values', () async {
      when(() => mockPrefs.getString('themeMode')).thenReturn('invalid');

      final result = await prefsManager.themeMode;

      expect(result, ThemeMode.system);
      verify(() => mockPrefs.getString('themeMode')).called(1);
    });
  });
}
