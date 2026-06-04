import 'package:flutter/material.dart';
import 'package:movies_app/features/home/widgets/horizontal_movies_list.dart';
import 'package:movies_app/features/home/widgets/movies_header.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class MoviesCategorySection
    extends StatelessWidget {

  final String title;

  final List<MovieModel> movies;

  const MoviesCategorySection({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        MoviesHeader(title: title),

        const SizedBox(height: 12),

        HorizontalMoviesList(
          movies: movies,
        ),
      ],
    );
  }
}