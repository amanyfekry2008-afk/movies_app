import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';
import 'package:movies_app/features/movie_details/movie_details_screen.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class SimilarMoviesSection
    extends StatelessWidget {

  final List<MovieModel>
  suggestionsMovies;

  const SimilarMoviesSection({
    super.key,
    required this.suggestionsMovies,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          'Similar',

          style:
          AppText.title.copyWith(
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 18),

        GridView.builder(
          shrinkWrap: true,

          physics:
          const NeverScrollableScrollPhysics(),

          itemCount:
          suggestionsMovies.length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 14,
            childAspectRatio: 0.64,
          ),

          itemBuilder:
              (context, index) {

            final movie =
            suggestionsMovies[index];

            return MovieCard(
              image: movie.image,

              rating:
              movie.rating.toString(),

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
      ],
    );
  }
}