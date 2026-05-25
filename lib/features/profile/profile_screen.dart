import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/profile/widgets/movies_grid.dart';
import 'package:movies_app/features/profile/widgets/profile_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.black,

        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),

              const ProfileSection(),

              const SizedBox(height: 24),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: AppColors.yellow,
                  labelColor: AppColors.yellow,
                  unselectedLabelColor: AppColors.white,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.list),
                      text: 'Watch List',
                    ),
                    Tab(
                      icon: Icon(Icons.folder),
                      text: 'History',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.empty,
                        width: 140,
                      ),
                    ),

                    MoviesGrid(movies: movies),
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