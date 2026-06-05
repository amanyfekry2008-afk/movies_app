import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/cast_card/cast_card.dart';
import 'package:movies_app/core/widgets/cast_card/cast_model.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';
import 'package:movies_app/features/home/widgets/horizontal_movies_list.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_state.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit()..getMovieDetails(movie.id),

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
                            top: 16,
                            left: 16,

                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,

                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },

                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.white,
                                  size: 25,
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
                                  Icons.bookmark,
                                  color: AppColors.white,
                                  size: 25,
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
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Center(
                              child: Text(
                                state.movie.title,

                                textAlign: TextAlign.center,

                                style: AppText.title.copyWith(fontSize: 24),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Center(
                              child: Text(
                                state.movie.year.toString(),

                                style: AppText.regular.copyWith(
                                  color: AppColors.white.withValues(alpha: 0.7),

                                  fontSize: 16,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            SizedBox(
                              width: double.infinity,
                              height: 55,

                              child: CustomButton(
                                text: 'Watch Now',
                                onPressed: () {},
                              ),
                            ),

                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                MovieRating(text: "15+", icon: Icons.favorite),

                                MovieRating(
                                  text: "${state.movie.runtime} min",

                                  icon: Icons.timer,
                                ),

                                MovieRating(
                                  text: state.movie.rating.toStringAsFixed(1),

                                  icon: Icons.star,
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            Text(
                              'Screenshots',

                              style: AppText.title.copyWith(fontSize: 20),
                            ),

                            const SizedBox(height: 16),

                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,

                              itemCount: state.movie.screenshots.length,

                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 12);
                              },

                              itemBuilder: (context, index) {
                                final image = state.movie.screenshots[index];

                                if (image.isEmpty) {
                                  return const SizedBox();
                                }

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(16),

                                  child: Image.network(
                                    image,
                                    width: 300,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 24),

                            Text(
                              'Similar',

                              style: AppText.title.copyWith(fontSize: 20),
                            ),

                            const SizedBox(height: 16),

                            GridView.builder(
                              shrinkWrap: true,

                              physics: const NeverScrollableScrollPhysics(),

                              itemCount: state.suggestionsMovies.length,

                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    mainAxisExtent: 330,
                                  ),

                              itemBuilder: (context, index) {
                                final movie = state.suggestionsMovies[index];

                                return MovieCard(
                                  image: movie.image,
                                  rating: movie.rating.toString(),

                                  onTap: () {
                                    Navigator.push(
                                      context,

                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MovieDetailsScreen(
                                            movie: movie,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),

                            const SizedBox(height: 24),

                            Text(
                              'Summary',

                              style: AppText.title.copyWith(fontSize: 20),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              state.movie.summary,

                              style: AppText.regular.copyWith(
                                fontSize: 16,
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(height: 30),

                            Text(
                              'Genres',

                              style: AppText.title.copyWith(fontSize: 20),
                            ),

                            const SizedBox(height: 12),

                            Wrap(
                              spacing: 12,
                              runSpacing: 12,

                              children: state.movie.genres.map((genre) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),

                                  decoration: BoxDecoration(
                                    color: AppColors.grey,

                                    borderRadius: BorderRadius.circular(16),
                                  ),

                                  child: Text(
                                    genre,

                                    style: AppText.regular.copyWith(
                                      fontSize: 16,
                                      color: AppColors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cast',
                        style: AppText.title.copyWith(fontSize: 20),
                      ),
                    ),
                    // connect cast to api
                    
                    // ListView.separated(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: state.movie.cast.length,
                    //   separatorBuilder: (_, __) => const SizedBox(height: 10),
                    //   itemBuilder: (context, index) {
                    //     final actor = state.movie.cast[index];

                    //     return CastCard(
                    //       image: actor.image,
                    //       name: actor.name,
                    //       character: actor.character,
                    //     );
                    //   },
                    // ),

                            const SizedBox(height: 32),
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
