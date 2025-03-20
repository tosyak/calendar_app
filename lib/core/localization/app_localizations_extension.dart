import 'package:calendar_app/core/localization/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension LocalizationExtension on BuildContext {
  String translate(String key) {
    return AppLocalizations.of(this)?.translate(key) ?? key;
  }
}
