import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
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

        appBar: AppBar(backgroundColor: AppColors.black),

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
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      child: Image.network(
                        state.movie.image,

                        width: double.infinity,

                        height: 500,

                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(state.movie.title, style: AppText.title),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        MovieRating(text: "PG-13", icon: Icons.favorite),

                        MovieRating(text: "2h 10m", icon: Icons.timer),

                        MovieRating(
                          text: state.movie.rating.toStringAsFixed(1),

                          icon: Icons.star,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Text(
                      state.movie.year.toString(),

                      style: AppText.regular.copyWith(
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),
                    ),

                    const SizedBox(height: 24),

                    CustomButton(text: 'Watch Now', onPressed: () {}),

                    const SizedBox(height: 32),

                    Text('Summary', style: AppText.title),

                    const SizedBox(height: 12),


            Text(
            state.movie.summary,

            style:
            AppText.regular.copyWith(
            height: 1.6,
            ),
            ),
            const SizedBox(
            height: 32,
            ),

            Text(
            'Screenshots',

            style:
            AppText.title,
            ),

            const SizedBox(
            height: 16,
            ),

            SizedBox(
            height: 180,

            child: ListView.separated(
            scrollDirection:
            Axis.horizontal,

            itemCount:
            state.movie.screenshots.length,

            separatorBuilder:
            (context, index) {

            return const SizedBox(
            width: 12,
            );
            },

            itemBuilder:
            (context, index) {

            final image =
            state.movie
                .screenshots[index];

            if (image.isEmpty) {
            return const SizedBox();
            }

            return ClipRRect(
            borderRadius:
            BorderRadius.circular(
            16,
            ),

            child: Image.network(
            image,

            width: 300,

            fit: BoxFit.cover,
            ),
            );
            },
            ),
            ),

            const SizedBox(
            height: 32,
            ),

            Text(
            'Genres',

            style:
            AppText.title,
            ),

            const SizedBox(
            height: 16,
            ),

            Wrap(
            spacing: 12,
            runSpacing: 12,

            children:
            state.movie.genres.map(
            (genre) {

            return Container(
            padding:
            const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
            ),

            decoration: BoxDecoration(
            color: AppColors.grey,

            borderRadius:
            BorderRadius.circular(
            16,
            ),
            ),

            child: Text(
            genre,

            style:
            AppText.regular,
            ),
            );
            },
            ).toList(),
            ),



            const SizedBox(height: 32),

                    Text('Suggestions', style: AppText.title),

                    const SizedBox(height: 16),

                    HorizontalMoviesList(movies: state.suggestionsMovies),
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
