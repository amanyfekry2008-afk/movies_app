import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/home/cubit/home_cubit.dart';
import 'package:movies_app/features/home/cubit/home_state.dart';
import 'package:movies_app/features/home/widgets/banner_section.dart';
import 'package:movies_app/features/home/widgets/movies_category_section.dart';

class HomeScreen
    extends StatelessWidget {

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
      HomeCubit()..getMovies(),

      child: Scaffold(
        backgroundColor:
        AppColors.black,

        body: SafeArea(
          child:
          BlocBuilder<
              HomeCubit,
              HomeState>(
            builder:
                (context, state) {

              if (state
              is HomeLoading) {

                return const Center(
                  child:
                  CircularProgressIndicator(),
                );
              }

              if (state
              is HomeError) {

                return Center(
                  child: Text(
                    state.errorMessage,

                    style:
                    const TextStyle(
                      color:
                      Colors.white,
                    ),
                  ),
                );
              }

              if (state
              is HomeSuccess) {

                return ListView(
                  children: [

                    BannerSection(
                      movies:
                      state
                          .bannerMovies,
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    MoviesCategorySection(
                      title: 'Action',

                      movies:
                      state
                          .actionMovies,
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    MoviesCategorySection(
                      title: 'Drama',

                      movies:
                      state
                          .dramaMovies,
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    MoviesCategorySection(
                      title: 'Comedy',

                      movies:
                      state
                          .comedyMovies,
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    MoviesCategorySection(
                      title: 'Sci-Fi',

                      movies:
                      state
                          .sciFiMovies,
                    ),

                    const SizedBox(
                      height: 32,
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