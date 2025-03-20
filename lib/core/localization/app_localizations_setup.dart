import 'package:calendar_app/core/localization/app_localizations.dart';
import 'package:calendar_app/core/localization/app_localizations_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizationsSetup {
  static Iterable<Locale> get supportedLocales =>
      AppLocalizationEnum.supportedLocales;

  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode &&
          supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.first;
  }
}
