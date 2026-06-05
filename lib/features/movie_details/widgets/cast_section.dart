import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class CastSection extends StatelessWidget {

  final List<Map<String, String>> castList;

  const CastSection({
    super.key,
    required this.castList,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          'Cast',

          style:
          AppText.title.copyWith(
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 18),

        Column(
          children: castList.map((cast) {

            return Container(
              margin:
              const EdgeInsets.only(
                bottom: 14,
              ),

              padding:
              const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: AppColors.grey,

                borderRadius:
                BorderRadius.circular(
                  18,
                ),
              ),

              child: Row(
                children: [

                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(
                      14,
                    ),

                    child: Image.asset(
                      cast['image']!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          cast['name']!,

                          style:
                          AppText.title.copyWith(
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          cast['character']!,

                          style:
                          AppText.regular.copyWith(
                            fontSize: 14,

                            color:
                            AppColors.white
                                .withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}