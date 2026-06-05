import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/movie_card/small_movie_card.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class MoviesGrid extends StatelessWidget {

  final List<MovieModel> movies;

  const MoviesGrid({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {

    if (movies.isEmpty) {
      return const Center(
        child: Text(
          "No Movies Yet",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(
        16,
        0,
        16,
        100,
      ),

      physics:
      const BouncingScrollPhysics(),

      itemCount: movies.length,

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.66,
      ),

      itemBuilder: (context, index) {

        final movie = movies[index];

        return SmallMovieCard(
          image: movie.image,
          rating:
          movie.rating.toStringAsFixed(1),
        );
      },
    );
  }
}