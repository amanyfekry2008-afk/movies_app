import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/utils/app_text.dart';

import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';

import 'package:movies_app/features/auth/controllers/auth_controllers.dart';
import 'package:movies_app/features/auth/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/cubit/auth_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Reset link sent")),
                  );

                  Navigator.pop(context);
                }

                if (state is AuthError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },

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

                      Expanded(
                        child: Text(
                          "Forget Password",

                          textAlign: TextAlign.center,

                          style: AppText.regular.copyWith(
                            color: AppColors.yellow,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(width: 40),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Center(
                    child: Image.asset(
                      AppImages.forgotPassword,

                      width: width * 0.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  CustomTextField(
                    controller: emailController,

                    hintText: "Email",

                    prefixIcon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    text: "Verify Email",

                    onPressed: () {
                      if (emailController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter your email")),
                        );

                        return;
                      }

                      context.read<AuthCubit>().resetPassword(
                        email: emailController.text.trim(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
