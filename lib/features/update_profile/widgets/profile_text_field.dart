import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class ProfileTextField extends StatelessWidget {

  final String hint;

  const ProfileTextField({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      style: const TextStyle(
        color: AppColors.white,
      ),

      decoration: InputDecoration(

        hintText: hint,

        hintStyle: const TextStyle(
          color: AppColors.white,
        ),

        filled: true,

        fillColor: AppColors.grey,

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}