import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class Button2 extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Button2({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(398, 55),
        backgroundColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.yellow),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: AppColors.yellow, fontSize: 20),
        ),
      ),
    );
  }
}
