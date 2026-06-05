import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text.dart';

class ScreenshotsSection extends StatelessWidget {

  final List<String> screenshots;

  const ScreenshotsSection({
    super.key,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          'Screen Shots',

          style:
          AppText.title.copyWith(
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 18),

        Column(
          children:
          screenshots.map((image) {

            if (image.isEmpty) {
              return const SizedBox();
            }

            return Padding(
              padding:
              const EdgeInsets.only(
                bottom: 20,
              ),

              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(18),

                child: Image.network(
                  image,
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}