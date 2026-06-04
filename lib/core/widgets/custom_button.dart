import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;

  final bool isOutlined;

  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,

        style: ElevatedButton.styleFrom(
          elevation: 0,

          backgroundColor: isOutlined ? AppColors.black : AppColors.yellow,

          side: isOutlined ? const BorderSide(color: AppColors.yellow) : null,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,

                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.black,
                ),
              )
            : Text(
                text,

                style: AppText.regular.copyWith(
                  color: isOutlined ? AppColors.yellow : AppColors.black,

                  fontSize: 18,

                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
