import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Inter",
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
    ),
  );
}
