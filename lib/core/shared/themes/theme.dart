import 'package:calendar_app/core/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData.light(
      useMaterial3: true,
    ).copyWith(scaffoldBackgroundColor: AppColors.mainGreyBackground);
  }

  static ThemeData get darkTheme {
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(scaffoldBackgroundColor: AppColors.backgroundDark);
  }
}
