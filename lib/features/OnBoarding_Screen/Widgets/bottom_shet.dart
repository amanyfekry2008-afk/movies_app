import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/OnBoarding_Screen/Widgets/Button1.dart';
import 'package:movies_app/features/OnBoarding_Screen/Widgets/button2.dart';

class Bottom_Sheet extends StatelessWidget {
  final String label;
  final String description;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final String text1;
  final String text2;
  final bool isonebutton;
  final bool firstindex;
  const Bottom_Sheet({
    super.key,
    required this.label,
    required this.description,
    required this.onPressed1,
    required this.onPressed2,
    required this.text1,
    required this.text2,
    required this.isonebutton,
    required this.firstindex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black,
        gradient: firstindex
            ? LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.black, Colors.transparent],
              )
            : null,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.white,
              fontSize: firstindex ? 36 : 24,
              fontWeight: firstindex ? FontWeight.w500 : FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Button1(text: text1, onPressed: onPressed1),
          Visibility(
            visible: !isonebutton,
            child: Button2(text: text2, onPressed: onPressed2),
          ),
        ],
      ),
    );
  }
}
