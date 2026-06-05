import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/profile/cubit/profile_cubit.dart';
import 'package:movies_app/features/profile/cubit/profile_state.dart';
import 'package:movies_app/features/profile/widgets/movies_grid.dart';
import 'package:movies_app/features/profile/widgets/profile_section.dart';

import '../auth/cubit/auth_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProfileCubit>().getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        backgroundColor: AppColors.black,

        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final user = context.read<AuthCubit>().user;

              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.yellow),
                );
              }

              if (state is ProfileError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }

              if (state is ProfileSuccess) {
                return Column(
                  children: [
                    const SizedBox(height: 20),

                    const SizedBox(height: 16),

                    ProfileSection(user: user),
                    const SizedBox(height: 20),

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
                          Tab(icon: Icon(Icons.list), text: 'Watch List'),

                          Tab(icon: Icon(Icons.history), text: 'History'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Expanded(
                      child: TabBarView(
                        children: [
                          MoviesGrid(movies: state.wishlistMovies),

                          MoviesGrid(movies: state.historyMovies),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
