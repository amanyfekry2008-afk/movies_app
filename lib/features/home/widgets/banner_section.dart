import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/widgets/responsive_image.dart';
import 'package:movies_app/features/home/widgets/custom_page_view.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class BannerSection extends StatefulWidget {
  final List<MovieModel> movies;

  const BannerSection({super.key, required this.movies});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.72,

      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              widget.movies[currentIndex].image,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [
                    AppColors.black.withValues(alpha: 0.3),

                    AppColors.black.withValues(alpha: 0.85),
                  ],
                ),
              ),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 12),

              Center(
                child: ResponsiveImage(
                  width: 267,
                  height: 93,
                  image: AppImages.availableNow,
                ),
              ),

              SizedBox(
                height: 350,

                child: CustomPageView(
                  movies: widget.movies,

                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: ResponsiveImage(
                  width: 354,
                  height: 110,
                  image: AppImages.watchNow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
