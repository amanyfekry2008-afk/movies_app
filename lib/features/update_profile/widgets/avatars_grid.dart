import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';

class AvatarsGrid extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onAvatarSelected;

  const AvatarsGrid({
    super.key,
    required this.selectedIndex,
    required this.onAvatarSelected,
  });

  static const avatars = [
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: avatars.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () => onAvatarSelected(index),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelected
                    ? AppColors.yellow
                    : AppColors.yellow.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(avatars[index]),
            ),
          ),
        );
      },
    );
  }
}