import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class GenresSection extends StatelessWidget {

  final List<String> genres;

  const GenresSection({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          'Genres',

          style:
          AppText.title.copyWith(
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 16),

        Wrap(
          spacing: 10,
          runSpacing: 10,

          children:
          genres.map((genre) {

            return Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),

              decoration: BoxDecoration(
                color: AppColors.grey,

                borderRadius:
                BorderRadius.circular(
                  14,
                ),
              ),

              child: Text(
                genre,

                style:
                AppText.regular.copyWith(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}