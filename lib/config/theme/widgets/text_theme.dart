import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

enum TFonts {
  sfPro('SF Pro'),
  hmsGilbert('Hms Gilbert'),
  rotunda('Rotunda');

  final String value;
  const TFonts(this.value);
}

class TTextTheme {
  TTextTheme._();
  
  static const defaultFont = TFonts.sfPro;

  static TextTheme getTextTheme({
    required bool isDark,
    TFonts font = TFonts.sfPro,
  }) {
    final textColor = isDark ? AppColors.textColorDark : AppColors.textColorLight;
    final subTextColor = isDark ? AppColors.subTextColorDark : AppColors.subTextColorLight;

    return TextTheme(
      headlineLarge: TextStyle(
        fontFamily: font.value,
        color: textColor,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: font.value,
        color: textColor,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: font.value,
        color: textColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontFamily: font.value,
        color: textColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: font.value,
        color: textColor,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        fontFamily: font.value,
        color: textColor,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        fontFamily: font.value,
        color: subTextColor,
        fontSize: 12.0,
      ),
    );
  }

  static TextTheme get lightTextTheme => getTextTheme(isDark: false);
  static TextTheme get darkTextTheme => getTextTheme(isDark: true);
}