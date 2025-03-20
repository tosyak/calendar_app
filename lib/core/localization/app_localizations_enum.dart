import 'dart:ui';

enum AppLocalizationEnum {
  en('en', 'English'),
  ru('ru', 'Русский');

  final String label;
  final String labelFull;
  const AppLocalizationEnum(this.label, this.labelFull);

  static Iterable<Locale> get supportedLocales =>
      values.map((e) => Locale(e.label));
}
