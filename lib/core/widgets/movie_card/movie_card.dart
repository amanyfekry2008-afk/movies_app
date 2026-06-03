import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';
import 'package:movies_app/core/widgets/responsive_image.dart';
import 'package:movies_app/features/movie_details/movie_details.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: movie),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
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
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: ResponsiveImage(
                width: 234,
                height: 351,
                image: movie.posterImage,
                fit: BoxFit.cover,
                useResponsiveWidth: false,
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: MovieRating(text: movie.rating.toStringAsFixed(1)),
          ),
        ],
      ),
    );
  }
}