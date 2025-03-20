import 'package:calendar_app/core/app_router/router.dart';
import 'package:calendar_app/core/locale_cubit/cubit/locale_cubit.dart';
import 'package:calendar_app/core/localization/app_localizations.dart';
import 'package:calendar_app/core/localization/app_localizations_enum.dart';
import 'package:calendar_app/core/localization/app_localizations_extension.dart';
import 'package:calendar_app/core/shared/themes/app_text_style.dart';
import 'package:calendar_app/core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreenView extends StatefulWidget {
  const SettingsScreenView({super.key});

  @override
  SettingsScreenViewState createState() => SettingsScreenViewState();
}

class SettingsScreenViewState extends State<SettingsScreenView> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    final String titleLang =
        AppLocalizationEnum.values
            .firstWhere(
              (e) =>
                  e.label ==
                  AppLocalizations.of(context)!.currentLocale.toLowerCase(),
            )
            .labelFull;

    return Scaffold(
      appBar: AppBar(title: Text(context.translate('settings'))),
      body: ListView(
        children: [
          ListTile(
            title: Text(context.translate('language')),
            trailing: ElevatedButton(
              onPressed: () async {
                await LangSelectSheet.showLangs(context);
              },
              child: Text(titleLang),
            ),
          ),
          ListTile(
            title: Text(context.translate('theme')),
            trailing: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (state is GetThemeState) {
                  _isDarkTheme = state.theme == ThemeMode.dark;
                }
                return Switch(
                  value: _isDarkTheme,
                  onChanged: (bool value) {
                    context.read<ThemeCubit>().changeTheme(
                      _isDarkTheme ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LangSelectSheet {
  static Future<void> showLangs(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate('language'),
                style: AppTextStyles.getCustomFont.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 27.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppLocalizationEnum.values.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final localeEnum = AppLocalizationEnum.values[index];
                  final titleLang = localeEnum.labelFull;
                  final title = localeEnum.label;

                  return RadioListTile<String>(
                    title: Text(titleLang),
                    value: title,
                    groupValue:
                        AppLocalizations.of(
                          context,
                        )!.currentLocale.toLowerCase(),
                    onChanged: (value) async {
                      router.maybePop(title);
                      await context.read<LocaleCubit>().update(localeEnum);
                    },
                  );
                },
                separatorBuilder: (context, _) => SizedBox(height: 10.h),
              ),
              SizedBox(height: 22.h),
            ],
          ),
        );
      },
    );
  }
}
