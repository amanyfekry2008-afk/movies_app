import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/home/widgets/banner_section.dart';
import 'package:movies_app/features/home/widgets/movies_category_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> movies = [
      AppImages.movie1,
      AppImages.movie2,
      AppImages.movie3,
      AppImages.movie1,
      AppImages.movie2,
      AppImages.movie3,
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: ListView(
          children: [
            BannerSection(),
            const SizedBox(height: 32),
            MoviesCategorySection(title: 'Action', movies: movies),
            const SizedBox(height: 32),
            MoviesCategorySection(title: 'Drama', movies: movies),
          ],
        ),
      ),
    );
  }
}
