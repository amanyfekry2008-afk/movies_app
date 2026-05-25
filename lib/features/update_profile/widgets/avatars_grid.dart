import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';

class AvatarsGrid extends StatelessWidget {

  final String selectedAvatar;

  final Function(String) onAvatarSelected;

  const AvatarsGrid({
    super.key,
    required this.selectedAvatar,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {

    final avatars = [

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

    return GridView.builder(

      shrinkWrap: true,

      physics:
      const NeverScrollableScrollPhysics(),

      itemCount: avatars.length,

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 3,

        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),

      itemBuilder: (context, index) {

        final avatar = avatars[index];

        final isSelected =
            avatar == selectedAvatar;

        return GestureDetector(

          onTap: () {
            onAvatarSelected(avatar);
          },

          child: Container(

            padding: const EdgeInsets.all(3),

            decoration: BoxDecoration(

              borderRadius:
              BorderRadius.circular(18),

              border: Border.all(
                color: isSelected
                    ? AppColors.yellow
                    : AppColors.yellow
                    .withValues(alpha: 0.5),

                width: 1.5,
              ),
            ),

            child: CircleAvatar(
              backgroundImage:
              AssetImage(avatar),
            ),
          ),
        );
      },
    );
  }
}