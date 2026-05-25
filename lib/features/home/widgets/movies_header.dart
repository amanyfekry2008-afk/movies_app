import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class MoviesHeader extends StatelessWidget {
  final String title;

  const MoviesHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: AppText.regular.copyWith(color: AppColors.white),
          ),
         const  Spacer(),
          Text(
            'See More',
            style:AppText.regular.copyWith(color: AppColors.yellow),
          ),
          SizedBox(width: 3),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.yellow,
            size: 12,
          ),
        ],
      ),
    );
  }
}