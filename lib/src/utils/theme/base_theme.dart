import 'package:flutter/material.dart';
import 'package:weather_app/src/utils/theme/app_colors.dart';

ThemeData baseTheme = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AppColors.white,
  ),
  iconTheme: const IconThemeData(color: AppColors.white),
  inputDecorationTheme: const InputDecorationTheme(
    counterStyle: TextStyle(color: AppColors.white),
  ),
  scaffoldBackgroundColor: AppColors.mainBlack,
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.mainBlack,
    titleTextStyle: TextStyle(color: AppColors.white),
    contentTextStyle: TextStyle(color: AppColors.white),
  ),
  unselectedWidgetColor: AppColors.white,
  primaryColor: AppColors.purple,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.pink,
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: AppColors.mainBlack,
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    textColor: AppColors.white,
  ),
);
