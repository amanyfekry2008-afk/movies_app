import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';
import 'package:movies_app/core/widgets/responsive_image.dart';
import 'package:movies_app/features/browse/Movie_List.dart';
import 'package:movies_app/core/widgets/cast_card/cast_card.dart';
import 'package:movies_app/core/widgets/cast_card/cast_model.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;

  MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final List genres = ['Action', 'Sci-Fi', 'Adventure', "Fantasy", "Horror"];
    final similarMovies = genreMovies
        .where((m) => m.id != movie.id)
        .take(4)
        .toList();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ResponsiveImage(
                    image: movie.posterImage,
                    width: width,
                    height: 500,
                    fit: BoxFit.cover,
                    useResponsiveWidth: false,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          size: 25,
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 25,
                          Icons.bookmark,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: AppColors.white,
                      size: 45,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: AppText.title.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.year,
                      style: AppText.regular.copyWith(
                        color: AppColors.white.withValues(alpha: 0.7),
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Watch',
                          style: AppText.regular.copyWith(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieRating(
                          text: movie.ageRating,
                          icon: Icons.favorite,
                        ),
                        MovieRating(text: movie.duration, icon: Icons.timer),
                        MovieRating(
                          text: movie.rating.toStringAsFixed(1),
                          icon: Icons.star,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Screen Shots',
                        style: AppText.title.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (movie.screenshots.isNotEmpty)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: movie.screenshots.length,

                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: ResponsiveImage(
                              image: movie.screenshots[index],
                              width: 220,
                              height: 120,
                              fit: BoxFit.cover,
                              useResponsiveWidth: false,
                            ),
                          );
                        },
                      )
                    else
                      Text(
                        'No screenshots available',
                        style: AppText.regular.copyWith(
                          fontSize: 14,
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Similar',
                        style: AppText.title.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (similarMovies.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: similarMovies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          mainAxisExtent: 330,
                        ),
                        itemBuilder: (context, index) {
                          return MovieCard(movie: similarMovies[index]);
                        },
                      )
                    else
                      Text(
                        'No similar movies available',
                        style: AppText.regular.copyWith(
                          fontSize: 14,
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Summary',
                        style: AppText.title.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      movie.summary,
                      style: AppText.regular.copyWith(
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cast',
                        style: AppText.title.copyWith(fontSize: 20),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cast.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final actor = cast[index];

                        return CastCard(
                          image: actor.image,
                          name: actor.name,
                          character: actor.character,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Genres',
                        style: AppText.title.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 2,
                          ),
                      itemCount: genres.length,
                      itemBuilder: (context, index) {
                        final genre = genres[index];
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              genre,
                              style: AppText.regular.copyWith(
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
