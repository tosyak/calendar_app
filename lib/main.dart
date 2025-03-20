import 'package:auto_route/auto_route.dart';
import 'package:calendar_app/core/app_router/router.dart';
import 'package:calendar_app/core/connectivity_checker/connectivity_checker.dart';
import 'package:calendar_app/core/error/global_error_handler.dart';
import 'package:calendar_app/core/global_provider/global_provider.dart';
import 'package:calendar_app/core/locale_cubit/cubit/locale_cubit.dart';
import 'package:calendar_app/core/localization/app_localizations_enum.dart';
import 'package:calendar_app/core/localization/app_localizations_setup.dart';
import 'package:calendar_app/core/logger/app_logger.dart';
import 'package:calendar_app/data/datasources/local/app_preferences.dart';
import 'package:calendar_app/core/service_locator/service_locator.dart';
import 'package:calendar_app/core/shared/themes/theme.dart';
import 'package:calendar_app/core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  GlobalErrorHandler(
    builder: () async {
      WidgetsFlutterBinding.ensureInitialized();
      await setupServices();
      initializeLogger();
      final appPreferences = getIt<AppPreferences>();
      String? selectedLanguage = await appPreferences.locale;
      if (selectedLanguage == null || selectedLanguage.isEmpty) {
        selectedLanguage = AppLocalizationEnum.ru.label;
        appPreferences.saveLocale(selectedLanguage);
      }
      return GlobalProvider(
        userLocale: selectedLanguage,
        child: const AppRoot(),
      );
    },
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              final themeMode =
                  themeState is GetThemeState
                      ? themeState.theme
                      : ThemeMode.system;
              return MaterialApp.router(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                routerDelegate: AutoRouterDelegate(router),
                routeInformationParser: router.defaultRouteParser(),
                locale: state.locale,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                builder: (context, child) {
                  final MediaQueryData data = MediaQuery.of(context);
                  return MediaQuery(
                    data: data.copyWith(
                      textScaler: TextScaler.linear(
                        data.textScaler.scale(1) > 1.5 ? 1.5 : 1,
                      ),
                    ),
                    child: ConnectionChecker(child: child!),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
