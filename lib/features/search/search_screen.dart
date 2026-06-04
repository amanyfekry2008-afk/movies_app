import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';
import 'package:movies_app/features/movie_details/movie_details_screen.dart';
import 'package:movies_app/features/search/cubit/search_cubit.dart';
import 'package:movies_app/features/search/cubit/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),

      child: Scaffold(
        backgroundColor: AppColors.black,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),

                      decoration: BoxDecoration(
                        color: AppColors.grey,

                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: TextFormField(
                        style: AppText.regular,

                        onChanged: (value) {
                          context.read<SearchCubit>().searchMovies(value);
                        },

                        decoration: const InputDecoration(
                          border: InputBorder.none,

                          hintText: 'Search',

                          hintStyle: TextStyle(color: AppColors.white),

                          prefixIcon: Icon(
                            Icons.search,

                            color: AppColors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is SearchError) {
                        return Center(
                          child: Text(
                            state.errorMessage,

                            style: AppText.regular,
                          ),
                        );
                      }

                      if (state is SearchSuccess) {
                        return GridView.builder(
                          itemCount: state.movies.length,

                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,

                                crossAxisSpacing: 14,

                                mainAxisSpacing: 14,

                                childAspectRatio: 0.67,
                              ),

                          itemBuilder: (context, index) {
                            final movie = state.movies[index];

                            return MovieCard(
                              image: movie.image,

                              rating: movie.rating.toString(),

                              onTap: () {
                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MovieDetailsScreen(movie: movie);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
