import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/movie_card/movie_rating.dart';
import 'package:movies_app/core/widgets/responsive_image.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenshots = [
      AppImages.movie1,
      AppImages.movie2,
      AppImages.movie3,
    ];

    final similarMovies = [
      AppImages.movie1,
      AppImages.movie2,
      AppImages.movie3,
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ResponsiveImage(
                    image: AppImages.movie1,
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                    useResponsiveWidth: false,
                  ),

                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor:
                      Colors.black.withValues(alpha: 0.5),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 16,
                    right: 16,
                    child: CircleAvatar(
                      backgroundColor:
                      Colors.black.withValues(alpha: 0.5),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: AppColors.white,
                      size: 45,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Doctor Strange in the Multiverse of Madness',
                      textAlign: TextAlign.center,
                      style: AppText.title.copyWith(
                        fontSize: 24,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '2022',
                      style: AppText.regular.copyWith(
                        color:
                        AppColors.white.withValues(alpha: 0.7),
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Watch',
                          style: AppText.regular.copyWith(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        MovieRating(text: '15'),
                        MovieRating(text: '90'),
                        MovieRating(text: '7.6'),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Screen Shots',
                        style: AppText.title.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: screenshots.length,
                        separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius:
                            BorderRadius.circular(16),
                            child: ResponsiveImage(
                              image: screenshots[index],
                              width: 220,
                              height: 120,
                              fit: BoxFit.cover,
                              useResponsiveWidth: false,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Similar',
                        style: AppText.title.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: similarMovies.length,
                        separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius:
                            BorderRadius.circular(20),
                            child: ResponsiveImage(
                              image: similarMovies[index],
                              width: 150,
                              height: 250,
                              fit: BoxFit.cover,
                              useResponsiveWidth: false,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Summary',
                        style: AppText.title.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Doctor Strange teams up with old and new mystical allies across the multiverse to confront a mysterious new adversary.',
                      style: AppText.regular.copyWith(
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}