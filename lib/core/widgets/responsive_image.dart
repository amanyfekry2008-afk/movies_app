import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final double width;
  static const double figmaScreenWidth = 430;
  final double height;
  final String image;
  final BoxFit fit;
  final bool useResponsiveWidth;
  const ResponsiveImage({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    this.fit = BoxFit.contain,
    this.useResponsiveWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = AspectRatio(
      aspectRatio: width / height,
      child: Image.asset(
        image,
        fit: fit,
      ),
    );

    if (useResponsiveWidth) {
      return SizedBox(
        width:
        MediaQuery.of(context).size.width *
            (width / figmaScreenWidth),
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}