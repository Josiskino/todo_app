import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_images.dart';

class CustomBackArrow extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double size;

  const CustomBackArrow({
    super.key,
    this.onTap,
    this.color,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;

    final defaultColor = Theme.of(context).textTheme.bodySmall?.color;

    return GestureDetector(
      onTap: onTap ?? () => context.pop(),
      child: Image.asset(
        themeMode == ThemeMode.light
            ? AppImages.arrowBackIcon
            : AppImages.arrowBackIconDark,
        width: size,
        height: size,
        color: color ?? defaultColor,
      ),
    );
  }
}
