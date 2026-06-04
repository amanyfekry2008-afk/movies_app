import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';

class SmallMovieCard extends StatelessWidget {
  final String image;
  final String rating;

  const SmallMovieCard({super.key, required this.image, required this.rating});

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

            child: Image.network(
              image,
              width: 146,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          top: 8,
          left: 8,

          child: MovieRating(text: rating, icon: Icons.star),
        ),
      ],
    );
  }
}
