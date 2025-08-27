import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_app/presentation/views/screen1.dart';
import 'package:todo_app/presentation/views/screen2.dart';
import 'package:todo_app/presentation/views/screen3.dart';
import 'package:todo_app/presentation/views/screen4.dart';
import 'package:todo_app/presentation/views/screen5.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_strings.dart';
import '../widgets/custom_bottom_nav_bar/custom_bottom_nav_bar_item.dart';
import '../widgets/custom_bottom_nav_bar/custum_bottom_nav_bar.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends ConsumerState<MainScreen> {
  int currentTab = 0;
  bool showActiveBar = false; 

  void onTabSelected(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> screens = [
      const Screen1(),
      const Screen2(),
      const Screen3(),
      const Screen4(),
      const Screen5(),
    ];

    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        unSelectedColor: isDarkMode
            ? AppColors.subTextColorDark
            : AppColors.subTextColorLight,
        selectedColor: Theme.of(context).colorScheme.primary,
        onTap: onTabSelected,
        selectedTab: currentTab,
        showActiveBar: showActiveBar, // Passer l'option à la barre de navigation
        children: const [
          CustomBottomAppBarItem(
            icon: Iconsax.home,
            text: AppTextStrings.home,
          ),
          CustomBottomAppBarItem(
            icon: Icons.assignment_outlined,
            text: AppTextStrings.eaddressBook,
          ),
          CustomBottomAppBarItem(
            icon: Icons.assignment_outlined,
            text: AppTextStrings.eaddressBook,
          ),
          CustomBottomAppBarItem(
            icon: Icons.favorite_outline,
            text: AppTextStrings.favourites,
          ),
          CustomBottomAppBarItem(
            icon: Iconsax.setting,
            text: AppTextStrings.settings,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
    );
  }
}
