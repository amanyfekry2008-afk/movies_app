import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import 'package:movies_app/features/layout/layout_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.yellow,
                      ),
                    ),

                    const Expanded(
                      child: Text(
                        "Forget Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 20),

                Center(
                  child: Image.asset(
                    AppImages.forgotPassword,
                    width: 200,
                    height: 200,
                  ),
                ),

                const SizedBox(height: 30),

                const CustomTextField(
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 25),

                CustomButton(text: "Verify Email", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
