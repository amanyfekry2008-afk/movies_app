import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';
import 'package:movies_app/features/browse/cubit/browse_cubit.dart';
import 'package:movies_app/features/browse/cubit/browse_state.dart';

class BrowseScreen
    extends StatelessWidget {

  const BrowseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
      BrowseCubit()
        ..getMoviesByGenre(
          'Action',
        ),

      child: Scaffold(
        backgroundColor:
        AppColors.black,

        body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),

            child:
            BlocBuilder<
                BrowseCubit,
                BrowseState>(
              builder:
                  (context, state) {

                final cubit =
                context
                    .read<
                    BrowseCubit>();

                return Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    SizedBox(
                      height: 40,

                      child:
                      ListView.separated(
                        scrollDirection:
                        Axis.horizontal,

                        itemCount:
                        cubit.genres.length,

                        separatorBuilder:
                            (
                            context,
                            index,
                            ) {

                          return const SizedBox(
                            width: 8,
                          );
                        },

                        itemBuilder:
                            (
                            context,
                            index,
                            ) {

                          final genre =
                          cubit.genres[index];

                          bool isSelected =
                          false;

                          if (state
                          is BrowseSuccess) {

                            isSelected =
                                state.selectedGenre ==
                                    genre;
                          }

                          return GestureDetector(
                            onTap: () {

                              cubit
                                  .getMoviesByGenre(
                                genre,
                              );
                            },

                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),

                              decoration:
                              BoxDecoration(
                                color:
                                isSelected
                                    ? AppColors
                                    .yellow
                                    : AppColors
                                    .grey,

                                borderRadius:
                                BorderRadius.circular(
                                  16,
                                ),
                              ),

                              alignment:
                              Alignment.center,

                              child: Text(
                                genre,

                                style:
                                AppText.regular
                                    .copyWith(
                                  color:
                                  isSelected
                                      ? AppColors
                                      .black
                                      : AppColors
                                      .white,

                                  fontSize:
                                  14,

                                  fontWeight:
                                  FontWeight
                                      .w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Expanded(
                      child:
                      Builder(
                        builder:
                            (context) {

                          if (state
                          is BrowseLoading) {

                            return const Center(
                              child:
                              CircularProgressIndicator(),
                            );
                          }

                          if (state
                          is BrowseError) {

                            return Center(
                              child: Text(
                                state
                                    .errorMessage,

                                style:
                                AppText.regular,
                              ),
                            );
                          }

                          if (state
                          is BrowseSuccess) {

                            return GridView.builder(
                              itemCount:
                              state
                                  .movies
                                  .length,

                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                2,

                                crossAxisSpacing:
                                14,

                                mainAxisSpacing:
                                14,

                                childAspectRatio:
                                0.67,
                              ),

                              itemBuilder:
                                  (
                                  context,
                                  index,
                                  ) {

                                final movie =
                                state
                                    .movies[index];

                                return MovieCard(
                                  image:
                                  movie.image,

                                  rating:
                                  movie.rating
                                      .toString(),
                                );
                              },
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}