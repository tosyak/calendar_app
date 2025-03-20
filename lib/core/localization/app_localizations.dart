import 'dart:convert';

import 'package:calendar_app/core/localization/app_localizations_delegate.dart';
import 'package:calendar_app/data/datasources/local/app_preferences.dart';
import 'package:calendar_app/core/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations({required this.locale});

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const delegate = AppLocalizationsDelegate();

  final Map<String, String> _localizedStrings = {};

  Future<void> load() async {
    final String contents = await getIt<AppPreferences>().getLanguageByCode(
      locale.languageCode,
    );

    Map<String, dynamic> jsonMap;

    if (contents.isNotEmpty) {
      jsonMap = json.decode(contents);
    } else {
      String jsonString =
          await rootBundle.loadString('lib/i18n/${locale.languageCode}.json');
      jsonMap = json.decode(jsonString);
    }

    jsonMap.forEach((key, value) {
      if (value != null && value is String) {
        _localizedStrings[key] = value;
      } else {
        _localizedStrings[key] = key;
      }
    });
  }

  String translate(String key) {
    final String translatedString = _localizedStrings[key] ?? key;
    return translatedString;
  }

  String get currentLocale => locale.languageCode.toUpperCase();
}
