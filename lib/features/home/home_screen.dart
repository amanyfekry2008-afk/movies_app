import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/browse/Movie_List.dart';
import 'package:movies_app/features/home/widgets/banner_section.dart';
import 'package:movies_app/features/home/widgets/movies_category_section.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class HomeScreen extends StatelessWidget {
  final void Function(String genre) onSeeMore;
  const HomeScreen({super.key, required this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies = genreMovies;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: ListView(
          children: [
            BannerSection(),
            const SizedBox(height: 32),
            MoviesCategorySection(
              title: 'Action',
              movies: movies,
              onSeeMore: onSeeMore,
            ),
            const SizedBox(height: 32),
            MoviesCategorySection(
              title: 'Drama',
              movies: movies,
              onSeeMore: onSeeMore,
            ),
          ],
        ),
      ),
    );
  }
}
