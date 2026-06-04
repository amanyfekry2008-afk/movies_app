import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/features/home/widgets/horizontal_movies_list.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_state.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class MovieDetailsScreen
    extends StatelessWidget {

  final MovieModel movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
      MovieDetailsCubit()
        ..getMovieDetails(
          movie.id,
        ),

      child: Scaffold(
        backgroundColor:
        AppColors.black,

        appBar: AppBar(
          backgroundColor:
          AppColors.black,
        ),

        body: BlocBuilder<
            MovieDetailsCubit,
            MovieDetailsState>(
          builder: (context, state) {

            if (state
            is MovieDetailsLoading) {

              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }

            if (state
            is MovieDetailsError) {

              return Center(
                child: Text(
                  state.errorMessage,

                  style:
                  AppText.regular,
                ),
              );
            }

            if (state
            is MovieDetailsSuccess) {

              return SingleChildScrollView(
                padding:
                const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),

                      child: Image.network(
                        state.movie.image,

                        width:
                        double.infinity,

                        height: 500,

                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      state.movie.title,

                      style:
                      AppText.title,
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    Row(
                      children: [

                        const Icon(
                          Icons.star,

                          color:
                          AppColors.yellow,
                        ),

                        const SizedBox(
                          width: 6,
                        ),

                        Text(
                          state.movie.rating
                              .toString(),

                          style:
                          AppText.regular,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    Text(
                      state.movie.year
                          .toString(),

                      style:
                      AppText.regular.copyWith(
                        color:
                        AppColors.white
                            .withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    CustomButton(
                      text: 'Watch Now',

                      onPressed: () {},
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    Text(
                      'Suggestions',

                      style:
                      AppText.title,
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    HorizontalMoviesList(
                      movies:
                      state
                          .suggestionsMovies,
                    ),
                  ],
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