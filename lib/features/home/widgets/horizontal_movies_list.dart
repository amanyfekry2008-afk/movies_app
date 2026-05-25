import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/movie_card/small_movie_card.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<String> movies;

  const HorizontalMoviesList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SmallMovieCard(
            image: movies[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemCount: movies.length,
      ),
    );
  }
}