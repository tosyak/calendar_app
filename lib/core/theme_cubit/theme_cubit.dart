import 'package:calendar_app/core/service_locator/service_locator.dart';
import 'package:calendar_app/data/datasources/local/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialState());

  Future<void> changeTheme(ThemeMode theme) async {
    final authPreferences = getIt<AppPreferences>();
    authPreferences.saveThemeMode(theme);
    final themeMode =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final uiStyle =
        theme == ThemeMode.dark
            ? SystemUiOverlayStyle.light
            : theme == ThemeMode.light
            ? SystemUiOverlayStyle.dark
            : themeMode == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
    emit(GetThemeState(theme));
  }

  Future<void> getTheme() async {
    final appPreferences = getIt<AppPreferences>();
    final res = await appPreferences.themeMode;
    emit(GetThemeState(res));
  }
}
