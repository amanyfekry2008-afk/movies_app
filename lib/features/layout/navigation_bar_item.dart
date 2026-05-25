import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_colors.dart';

class NavigationBarItem extends StatelessWidget {
  final String icon;
  final double width;
  final double height;
  final int index;
  final int currentIndex;
  final void Function(int) onTap;
  const NavigationBarItem({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    required this.icon,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: SvgPicture.asset(
        icon,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(
          currentIndex == index ? AppColors.yellow : AppColors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
