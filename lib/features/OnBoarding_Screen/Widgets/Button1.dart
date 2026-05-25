import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class Button1 extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Button1({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(398, 55),
        backgroundColor: AppColors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: AppColors.black, fontSize: 20),
        ),
      ),
    );
  }
}
