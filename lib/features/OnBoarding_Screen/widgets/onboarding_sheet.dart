import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import '../../../core/widgets/custom_button.dart';

class OnboardingSheet extends StatelessWidget {
  final String label;
  final String description;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
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
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(minHeight: height * 0.32),
      decoration: BoxDecoration(
        color: AppColors.black,
        gradient: isFirstPage
            ? const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.black, Colors.transparent],
              )
            : null,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppText.title.copyWith(fontSize: isFirstPage ? 30 : 22),
            ),
            if (description.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppText.regular.copyWith(fontSize: 18),
              ),
            ],
            const SizedBox(height: 24),
            CustomButton(text: text1, onPressed: onPressed1),
            if (!isOneButton) ...[
              const SizedBox(height: 16),
              CustomButton(
                text: text2,
                onPressed: onPressed2,
                isOutlined: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
