import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/browse/Movie_List.dart';
import 'package:movies_app/features/home/widgets/banner_section.dart';
import 'package:movies_app/features/home/widgets/movies_category_section.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';
import 'dart:math';
class HomeScreen extends StatefulWidget {
  final void Function(String genre) onSeeMore;

  const HomeScreen({
    super.key,
    required this.onSeeMore,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MovieModel> movies = genreMovies;

  final List<String> genres = [
    'Action',
    'Adventure',
    'Drama',
    'Comedy',
    'Animation',
  ];

  late String firstGenre;
  late String secondGenre;

  @override
  void initState() {
    super.initState();

    final shuffledGenres = List<String>.from(genres)..shuffle(Random());

    firstGenre = shuffledGenres[0];
    secondGenre = shuffledGenres[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: ListView(
          children: [
            BannerSection(),
            const SizedBox(height: 32),

            MoviesCategorySection(
              title: firstGenre,
              movies: movies,
              onSeeMore: widget.onSeeMore,
            ),

            const SizedBox(height: 32),

            MoviesCategorySection(
              title: secondGenre,
              movies: movies,
              onSeeMore: widget.onSeeMore,
            ),
          ],
        ),
      ),
    );
  }
}