import 'package:calendar_app/core/localization/app_localizations.dart';
import 'package:calendar_app/core/localization/app_localizations_enum.dart';
import 'package:flutter/material.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizationEnum.values
        .any((e) => e.label == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale: locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
