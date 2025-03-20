import 'dart:convert';

import 'package:calendar_app/core/locale_cubit/data/locale_repository.dart';
import 'package:calendar_app/core/localization/app_localizations_enum.dart';
import 'package:calendar_app/core/service_locator/service_locator.dart';
import 'package:calendar_app/data/datasources/local/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit({required this.langRepository, required String locale})
    : super(SelectedLocale(Locale(locale)));

  final LanguageRepository langRepository;

  Future<void> saveLanguages() async {
    final appPreferences = getIt<AppPreferences>();
    final val = await appPreferences.locale;

    final languages = await langRepository.getLanguageList();

    for (var entry in languages.entries) {
      final langCode = entry.key;
      final localizations = json.encode(entry.value);
      appPreferences.saveLanguageByCode(langCode, localizations);
    }

    if (val != null && val.isNotEmpty) emit(SelectedLocale(Locale(val)));
  }

  Future<void> initialize() async {
    await saveLanguages();
  }

  Future<void> update(AppLocalizationEnum locale) async {
    emit(SelectedLocale(Locale(locale.label)));
    await getIt<AppPreferences>().saveLocale(locale.label);
  }
}

abstract class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

class SelectedLocale extends LocaleState {
  const SelectedLocale(super.locale);
}
