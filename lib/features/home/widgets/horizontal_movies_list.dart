import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/movie_card/small_movie_card.dart';
import 'package:movies_app/features/movie_details/movie_details.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<MovieModel> movies;

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
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(
                    movie: movies[index],
                  ),
                ),
              );
            },
            child: SmallMovieCard(
              image: movies[index].posterImage,
            ),
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