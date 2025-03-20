import 'package:calendar_app/core/localization/app_localizations.dart';
import 'package:calendar_app/data/datasources/local/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';


class MockAppPreferences extends Mock implements AppPreferences {}

class MockRootBundle extends Mock {
  Future<String> loadString(String key, {bool cache = true});
}

void main() {
  late AppLocalizations appLocalizations;
  late MockAppPreferences mockAppPreferences;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    mockAppPreferences = MockAppPreferences();

    if (GetIt.I.isRegistered<AppPreferences>()) {
      GetIt.I.unregister<AppPreferences>();
    }

    GetIt.I.registerSingleton<AppPreferences>(mockAppPreferences);

    appLocalizations = AppLocalizations(locale: Locale('en'));
  });

  tearDown(() {
    if (GetIt.I.isRegistered<AppPreferences>()) {
      GetIt.I.unregister<AppPreferences>();
    }
  });

  group('AppLocalizations', () {
    test('should load localized strings from AppPreferences if available',
        () async {
      const jsonString = '{"hello": "Hello"}';
      when(() => mockAppPreferences.getLanguageByCode('en')).thenAnswer(
        (_) async => jsonString,
      );

      await appLocalizations.load();

      expect(appLocalizations.translate('hello'), 'Hello');
    });

    test('should return the correct current locale', () {
      appLocalizations = AppLocalizations(locale: Locale('en'));

      expect(appLocalizations.currentLocale, 'EN');
    });

    test('should handle malformed JSON from AppPreferences', () async {
      const malformedJsonString = '{"hello": "Hello"';
      when(() => mockAppPreferences.getLanguageByCode('en')).thenAnswer(
        (_) async => malformedJsonString,
      );

      expect(() => appLocalizations.load(), throwsA(isA<FormatException>()));
    });
  });
}
