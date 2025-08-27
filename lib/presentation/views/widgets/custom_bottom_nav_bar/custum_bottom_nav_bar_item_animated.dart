import 'package:flutter/material.dart';

import 'custom_bottom_nav_bar_item.dart';

class AnimatedNavBarItem extends StatelessWidget {
  final CustomBottomAppBarItem item;
  final bool isSelected;
  final Color selectedColor;
  final Color unSelectedColor;
  final VoidCallback onTap;
  final bool showActiveBar; // Option pour afficher/masquer la barre active

  const AnimatedNavBarItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.onTap,
    this.showActiveBar = true, // Valeur par défaut
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Utilisation de TweenAnimationBuilder pour le trait
            if (showActiveBar) // Conditionnellement afficher la barre active
              Positioned(
                top: 0,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0,
                    end: isSelected ? 1 : 0,
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return Container(
                      width: 32 * value,
                      height: 3,
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    );
                  },
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0,
                    end: isSelected ? 1 : 0,
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, -2 * value),
                      child: Transform.scale(
                        scale: 1 + (0.1 * value),
                        child: Icon(
                          item.icon,
                          color: Color.lerp(unSelectedColor, selectedColor, value),
                          size: 24,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 2),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    color: isSelected ? selectedColor : unSelectedColor,
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                  child: Text(
                    item.text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}