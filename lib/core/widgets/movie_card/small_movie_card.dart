import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';
import 'package:movies_app/core/widgets/responsive_image.dart';

class SmallMovieCard extends StatelessWidget {
  final String image;

  const SmallMovieCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: ResponsiveImage(
              width: 146,
              height: 220,
              image: image,
              fit: BoxFit.cover,
              useResponsiveWidth: false,
            ),
          ),
        ),

        const Positioned(top: 8, left: 8, child: MovieRating(text: '7.7')),
      ],
    );
  }
}
