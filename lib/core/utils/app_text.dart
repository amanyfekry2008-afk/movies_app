import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppText {
  static const TextStyle regular = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.white,
  );

  static const TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: AppColors.white,
  );
}