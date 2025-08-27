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
  final VoidCallback onCenterButtonTap;
  final bool isSelected; // Ajout de cette propriété

  const CustomBottomAppBar({
    super.key,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.onTap,
    required this.children,
    required this.selectedTab,
    required this.onCenterButtonTap,
    this.isSelected = false, // Valeur par défaut
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.brightness == Brightness.light
        ? AppColors.appBarColorLight
        : AppColors.appBarColorDark;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
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
            children: [
              ...List.generate(
                2,
                (index) => Expanded(
                  child: AnimatedNavBarItem(
                    item: children[index],
                    isSelected: selectedTab == index,
                    selectedColor: selectedColor,
                    unSelectedColor: unSelectedColor,
                    onTap: () => onTap(index),
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  width: 50,
                ),
              ),
              ...List.generate(
                2,
                (index) => Expanded(
                  child: AnimatedNavBarItem(
                    item: children[index + 2],
                    isSelected: selectedTab == index + 2,
                    selectedColor: selectedColor,
                    unSelectedColor: unSelectedColor,
                    onTap: () => onTap(index + 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 12,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onCenterButtonTap,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: isSelected ? 1 : 0),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut, // Ajout de la courbe easeOut
                builder: (context, value, child) {
                  return Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Transform.scale(
                      // Remplace AnimatedSlide par Transform.scale
                      scale: 1 + (0.2 * value), // Effet de scale léger
                      child: const Icon(
                        Icons.note_alt_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
