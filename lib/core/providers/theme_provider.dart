import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    
    // Utiliser Future.microtask pour retarder légèrement la mise à jour du systemOverlayStyle
    Future.microtask(() {
      SystemChrome.setSystemUIOverlayStyle(
        state == ThemeMode.light 
          ? const SystemUiOverlayStyle(
              statusBarColor: AppColors.appBarColorLight,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: AppColors.appBarColorDark,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
      );
    });
  }
}
