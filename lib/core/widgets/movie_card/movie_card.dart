import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';

class MovieCard extends StatelessWidget {

  final String image;
  final String rating;
  final VoidCallback? onTap;

  const MovieCard({
    super.key,
    required this.image,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final bool isNetworkImage =
    image.startsWith('http');

    return GestureDetector(
      onTap: onTap,

      child: Stack(
        clipBehavior: Clip.none,

        children: [

          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(20),

              color: AppColors.black,

              boxShadow: [
                BoxShadow(
                  color:
                  Colors.black.withValues(
                    alpha: 0.3,
                  ),

                  blurRadius: 10,

                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(20),

              clipBehavior: Clip.antiAlias,

              child:
              isNetworkImage
                  ? Image.network(
                image,
                width: 234,
                height: 351,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                image,
                width: 234,
                height: 351,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 12,
            left: 12,

            child: MovieRating(
              text: rating,
            ),
          ),
        ],
      ),
    );
  }
}