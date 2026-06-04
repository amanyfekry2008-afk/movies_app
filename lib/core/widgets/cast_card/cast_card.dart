import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CastCard extends StatelessWidget {
  final String image;
  final String name;
  final String character;

  const CastCard({
    super.key,
    required this.image,
    required this.name,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : $name',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),

                const SizedBox(height: 6),

                Text(
                  'Character : $character',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
