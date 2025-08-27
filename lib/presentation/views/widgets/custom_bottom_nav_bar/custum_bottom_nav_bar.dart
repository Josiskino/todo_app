import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'custom_bottom_nav_bar_item.dart';
import 'custum_bottom_nav_bar_item_animated.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Color selectedColor;
  final Color unSelectedColor;
  final Function(int index) onTap;
  final List<CustomBottomAppBarItem> children;
  final int selectedTab;
  final bool showActiveBar; // Option pour afficher/masquer la barre active

  const CustomBottomAppBar({
    super.key,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.onTap,
    required this.children,
    required this.selectedTab,
    this.showActiveBar = true, // Valeur par défaut
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.brightness == Brightness.light
        ? AppColors.appBarColorLight
        : AppColors.appBarColorDark;

    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.light
                ? Colors.black.withOpacity(0.05)
                : Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          children.length,
          (index) => Expanded(
            child: AnimatedNavBarItem(
              item: children[index],
              isSelected: selectedTab == index,
              selectedColor: selectedColor,
              unSelectedColor: unSelectedColor,
              onTap: () => onTap(index),
              showActiveBar: showActiveBar, // Passer l'option à chaque élément
            ),
          ),
        ),
      ),
    );
  }
}
