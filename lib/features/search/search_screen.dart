import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  style: AppText.regular,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: AppColors.white,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  itemCount: movies.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.67,
                  ),
                  itemBuilder: (context, index) {
                    return MovieCard(
                      image: movies[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}