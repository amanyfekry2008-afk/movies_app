import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        backgroundColor:
        isOutlined ? AppColors.black : AppColors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: isOutlined
              ? const BorderSide(color: AppColors.yellow)
              : BorderSide.none,
        ),
      ),
      child: Text(
        text,
        style: AppText.regular.copyWith(color: isOutlined ? AppColors.yellow : AppColors.black,),
      ),
    );
  }
}