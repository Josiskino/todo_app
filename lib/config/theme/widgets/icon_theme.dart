import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class TIconTheme {
  TIconTheme._();
  
  static IconThemeData lightThemeIconTheme = const IconThemeData(
    color: AppColors.textColorLight,
    size: 24.0,
    opacity: 1.0,
  );

  static IconThemeData darkThemeIconTheme = const IconThemeData(
    color: AppColors.textColorDark,
    size: 24.0,
    opacity: 1.0,
  );
}