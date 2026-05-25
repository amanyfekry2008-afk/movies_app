import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
class ProfileInfoItem extends StatelessWidget {
  final String number;
  final String title;

  const ProfileInfoItem({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: AppText.regular.copyWith(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: AppText.regular.copyWith(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}