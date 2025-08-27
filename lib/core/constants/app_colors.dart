import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //----------------------------------------------------------------------------
  // Light Theme Colors
  //----------------------------------------------------------------------------

  static const Color primaryColorLight = Color(0xFF006FE6);
  static const Color secondaryColorLight = Color(0xFF006FE6);
  static const Color tertiaryColorLight = Color(0xFF006FE6);

  static const Color backgroundColorLight = Color(0xFFF2F2F0);
  static const Color appBarColorLight = Colors.white;
  static const Color containerColorLight = Color(0xFFD9D8D7);

  static const Color surfaceColorLight = Color(0xFFE8E8E6);
  static const Color onSurfaceColorLight = Color(0xFF1A1A19);

  static const Color textColorLight = Color(0xFF030302);
  static const Color subTextColorLight = Color(0xFF4D4D4C);

  //----------------------------------------------------------------------------
  // Dark Theme Colors
  //----------------------------------------------------------------------------

  static const Color primaryColorDark = Color(0xFF1A8AFF);
  static const Color secondaryColorDark = Color(0xFF1A8AFF);
  static const Color tertiaryColorDark = Color(0xFF1A8AFF);

  static const Color backgroundColorDark = Color(0xFF1C1C1A);
  static const Color appBarColorDark = Color(0xFF2C2C2A);
  static const Color containerColorDark = Color(0xFF2D2D2B);

  static const Color surfaceColorDark = Color(0xFF252523);
  static const Color onSurfaceColorDark = Color(0xFFE6E6E4);

  static const Color textColorDark = Color(0xFFF2F2F0);
  static const Color subTextColorDark = Color(0xFFB3B3B0);

  // Status colors
  static const Color verifiedStatusColor = Colors.green;
  static const Color pendingStatusColor = Colors.orange;
  static const Color notVerifiedStatusColor = Colors.red;

  // Status background colors
  static const Color verifiedStatusBackgroundColor =
      Color(0xFFE8F5E9); // Light green
  static const Color pendingStatusBackgroundColor =
      Color(0xFFFFF3E0); // Light orange
  static const Color notVerifiedStatusBackgroundColor =
      Color(0xFFFFEBEE); // Light red
}
