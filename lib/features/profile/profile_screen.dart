import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/profile/widgets/movies_grid.dart';

import '../auth/cubit/auth_cubit.dart';
import '../auth/cubit/auth_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> movies = [
    AppImages.movie1,
    AppImages.movie2,
    AppImages.movie3,
  ];

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Future.microtask(() {
        context.read<AuthCubit>().getUser(user.uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: AppColors.black,

            body: SafeArea(
                child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final cubit = context.read<AuthCubit>();
                      final user = cubit.user;

                      if (state is AuthLoading && user == null) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.yellow,
                          ),
                        );
                      }

                      if (user == null) {
                        return const Center(
                          child: Text(
                            "No user found",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      return Column(
                          children: [
                          const SizedBox(height: 20),

                      Column(
                      children: [
                      CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.grey,
                      child: Text(
                      user.name.isNotEmpty
                      ? user.name[0].toUpperCase()
                          : "?",
                      style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      ),
                      ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                      user.name,
                      style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      ),
                      ),

                      Text(
                      user.email,
                      style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.7),
                      ),
                      ),
                      ],
                      ),

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
                      );
                    },
                ),
            ),
        ),
    );
  }
}