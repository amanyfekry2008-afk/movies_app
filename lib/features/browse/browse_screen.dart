import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';
import 'package:movies_app/features/browse/Movie_List.dart';

class BrowseScreen extends StatefulWidget {
  final String? genre;
   BrowseScreen({super.key , this.genre});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int selectedGenreIndex = 0;

  final genres = ['Action', 'Adventure', 'Animation', 'Drama', 'Comedy'];
  @override
  void initState() {
    super.initState();
    if (widget.genre != null) {
      selectedGenreIndex = genres.indexOf(widget.genre!);
    }
  }

  @override
  Widget build(BuildContext context) {
    
  
    final selectedGenre = genres[selectedGenreIndex];

    final movies = genreMovies
        .where((element) => element.genre == selectedGenre)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final isSelected = selectedGenreIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGenreIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.yellow : AppColors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          genres[index],
                          style: AppText.regular.copyWith(
                            color: isSelected
                                ? AppColors.black
                                : AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: movies.isEmpty
                    ? Center(
                        child: Text(
                          "No movies found",
                          style: AppText.regular.copyWith(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : GridView.builder(
                        itemCount: movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                              childAspectRatio: 0.67,
                            ),
                        itemBuilder: (context, index) {
                          return MovieCard(movie: movies[index]);
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
