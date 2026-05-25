import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/movie_card/small_movie_card.dart';

class MoviesGrid extends StatelessWidget {
  final List<String> movies;

  const MoviesGrid({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),

      physics: const BouncingScrollPhysics(),

      itemCount: movies.length,

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.66,
      ),

      itemBuilder: (context, index) {
        return SmallMovieCard(
          image: movies[index],
        );
      },
    );
  }
}