import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/movie_card/movie_card.dart';

class CustomPageView extends StatefulWidget {
  final List<String> movies;
  final Function(int) onPageChanged;
  const CustomPageView({
    super.key,
    required this.movies,
    required this.onPageChanged,
  });

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int currentIndex = 0;
  final PageController controller = PageController(
    viewportFraction: 0.56,
    initialPage: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      padEnds: true,
      itemCount: widget.movies.length,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });

        widget.onPageChanged(index);
      },
      itemBuilder: (context, index) {
        final bool isSelected = currentIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: EdgeInsets.symmetric(
            horizontal: 2,
            vertical: isSelected ? 0 : 20,
          ),
          child: Transform.scale(
            scale: isSelected ? 0.82 : 0.72,
            child: MovieCard(
              image: widget.movies[index],
            ),
          ),
        );
      },
    );
  }
}