import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_icons.dart';
import 'package:movies_app/features/layout/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final void  Function(int) onTap;
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Container(
        padding:  const EdgeInsets.symmetric(vertical: 16,),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationBarItem(
              currentIndex: currentIndex,
              index: 0,
              onTap: onTap,
              icon: AppIcons.homeIcon,
              width: 26,
              height: 23,
            ),
            NavigationBarItem(
              currentIndex: currentIndex,
              index: 1,
              onTap: onTap,
              icon: AppIcons.searchIcon,
              width: 24,
              height: 24,
            ),
            NavigationBarItem(
              currentIndex: currentIndex,
              index: 2,
              onTap: onTap,
              icon: AppIcons.exploreIcon,
              width: 22.42,
              height: 22.42,
            ),
            NavigationBarItem(
              currentIndex: currentIndex,
              index: 3,
              onTap: onTap,
              icon: AppIcons.profileIcon,
              width: 22.42,
              height: 22.42,
            ),
      
          ],
        ),
      ),
    );
  }
}
