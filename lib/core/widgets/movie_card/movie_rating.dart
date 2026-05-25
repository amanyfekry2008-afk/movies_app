import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class MovieRating extends StatelessWidget {
  final String text;

  const MovieRating({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 3,
      ),

      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.60),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppText.regular.copyWith(
              fontSize: 12,
              color: AppColors.white,
            ),
          ),

          const SizedBox(width: 2),

          const  Icon(
            Icons.star,
            color: AppColors.yellow,
            size: 12,
          ),
        ],
      ),
    );
  }
}