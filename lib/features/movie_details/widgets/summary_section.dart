import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class SummarySection
    extends StatelessWidget {

  final String summary;

  const SummarySection({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          'Summary',

          style:
          AppText.title.copyWith(
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 14),

        Text(
          summary,

          style:
          AppText.regular.copyWith(
            fontSize: 15,
            height: 1.8,

            color:
            AppColors.white
                .withValues(
              alpha: 0.85,
            ),
          ),
        ),
      ],
    );
  }
}