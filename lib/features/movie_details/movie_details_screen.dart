import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_state.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';
import 'package:movies_app/features/movie_details/widgets/cast_section.dart';
import 'package:movies_app/features/movie_details/widgets/genres_section.dart';
import 'package:movies_app/features/movie_details/widgets/screenshots_section.dart';
import 'package:movies_app/features/movie_details/widgets/similar_movies_section.dart';
import 'package:movies_app/features/movie_details/widgets/summary_section.dart';
import 'package:movies_app/features/profile/cubit/profile_cubit.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool isAddedToHistory = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> castList = [
      {
        "name": "Hayley Atwell",
        "character": "Captain Carter",
        "image": AppImages.actor1,
      },

      {
        "name": "Elizabeth Olsen",
        "character": "Wanda Maximoff / The Scarlet Witch",
        "image": AppImages.actor2,
      },

      {
        "name": "Rachel McAdams",
        "character": "Dr. Christine Palmer",
        "image": AppImages.actor3,
      },

      {
        "name": "Charlize Theron",
        "character": "Clea",
        "image": AppImages.actor4,
      },
    ];

    return BlocProvider(
      create: (context) =>
          MovieDetailsCubit()..getMovieDetails(widget.movie.id),

      child: Scaffold(
        backgroundColor: AppColors.black,

        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MovieDetailsError) {
              return Center(
                child: Text(state.errorMessage, style: AppText.regular),
              );
            }

            if (state is MovieDetailsSuccess) {
              if (!isAddedToHistory) {
                isAddedToHistory = true;

                Future.microtask(() {
                  context.read<ProfileCubit>().addToHistory(state.movie);
                });
              }

              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Stack(
                        alignment: Alignment.center,

                        children: [
                          Image.network(
                            state.movie.image,
                            width: double.infinity,
                            height: 500,
                            fit: BoxFit.cover,
                          ),

                          Positioned(
                            top: 20,
                            left: 16,

                            child: Container(
                              width: 45,
                              height: 45,

                              decoration: BoxDecoration(
                                color: AppColors.black.withValues(alpha: 0.4),
                                shape: BoxShape.circle,
                              ),

                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },

                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 20,
                            right: 16,

                            child: Container(
                              width: 45,
                              height: 45,

                              decoration: BoxDecoration(
                                color: AppColors.black.withValues(alpha: 0.4),
                                shape: BoxShape.circle,
                              ),

                              child: IconButton(
                                onPressed: () async {
                                  await context
                                      .read<ProfileCubit>()
                                      .addToWishlist(state.movie);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Added To Wishlist'),
                                    ),
                                  );
                                },

                                icon: const Icon(
                                  Icons.bookmark_border,
                                  color: AppColors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: 82,
                            height: 82,

                            decoration: const BoxDecoration(
                              color: AppColors.yellow,
                              shape: BoxShape.circle,
                            ),

                            child: const Icon(
                              Icons.play_arrow_rounded,
                              color: AppColors.white,
                              size: 50,
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 22,
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Center(
                              child: Text(
                                state.movie.title,

                                textAlign: TextAlign.center,

                                style: AppText.title.copyWith(fontSize: 25),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Center(
                              child: Text(
                                state.movie.year.toString(),

                                style: AppText.regular.copyWith(
                                  color: AppColors.white.withValues(alpha: 0.7),
                                  fontSize: 15,
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            SizedBox(
                              width: double.infinity,
                              height: 56,

                              child: CustomButton(
                                text: 'Watch Now',
                                onPressed: () {},
                              ),
                            ),

                            const SizedBox(height: 24),

                            Row(
                              children: [
                                Expanded(
                                  child: MovieRating(
                                    text: "15+",
                                    icon: Icons.favorite,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: MovieRating(
                                    text: "${state.movie.runtime} min",
                                    icon: Icons.timer,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: MovieRating(
                                    text: state.movie.rating.toStringAsFixed(1),
                                    icon: Icons.star,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 34),

                            ScreenshotsSection(
                              screenshots: state.movie.screenshots,
                            ),

                            const SizedBox(height: 18),

                            SimilarMoviesSection(
                              suggestionsMovies: state.suggestionsMovies,
                            ),

                            const SizedBox(height: 32),

                            SummarySection(summary: state.movie.summary),

                            const SizedBox(height: 34),

                            CastSection(castList: castList),

                            const SizedBox(height: 32),

                            GenresSection(genres: state.movie.genres),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
