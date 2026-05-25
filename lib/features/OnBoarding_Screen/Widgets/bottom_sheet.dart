import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/features/OnBoarding_Screen/Widgets/custom_button.dart';

class OnboardingSheet extends StatelessWidget {
  final String label;
  final String description;
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;
  final String text1;
  final String text2;
  final bool isOneButton;
  final bool isFirstPage;

  const OnboardingSheet({
    super.key,
    required this.label,
    required this.description,
    required this.onPressed1,
    required this.onPressed2,
    required this.text1,
    required this.text2,
    required this.isOneButton,
    required this.isFirstPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.black,
        gradient: isFirstPage
            ? const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
        )
            : null,
        borderRadius: const BorderRadius.only(
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
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppText.regular.copyWith(
              fontSize: isFirstPage ? 36 : 24,
              fontWeight: isFirstPage ? FontWeight.w500 : FontWeight.bold,
            ),
          ),

          Text(
            description,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: AppText.regular,
          ),

          CustomButton(
            text: text1,
            onPressed: onPressed1,
          ),

          Visibility(
            visible: !isOneButton,
            child: CustomButton(
              text: text2,
              onPressed: onPressed2,
              isOutlined: true,
            ),
          ),
        ],
      ),
    );
  }
}