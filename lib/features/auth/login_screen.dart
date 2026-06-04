import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_icons.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/core/utils/app_text.dart';

import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';

import 'package:movies_app/features/auth/controllers/auth_controllers.dart';
import 'package:movies_app/features/auth/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/cubit/auth_state.dart';

import 'package:movies_app/features/auth/register_screen.dart';
import 'package:movies_app/features/auth/reset_password_screen.dart';

import 'package:movies_app/features/layout/layout_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = true;

  int selectedLang = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,

                MaterialPageRoute(
                  builder: (context) {
                    return const LayoutScreen();
                  },
                ),
              );
            }

            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  const SizedBox(height: 24),

                  Center(child: Image.asset(AppImages.logoApp, height: 180)),

                  const SizedBox(height: 32),

                  CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                    prefixIcon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock_outlined,
                    obscureText: isPasswordHidden,

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },

                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,

                        color: AppColors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) {
                              return const ResetPasswordScreen();
                            },
                          ),
                        );
                      },

                      child: Text(
                        "Forgot Password?",

                        style: AppText.regular.copyWith(
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: "Login",

                        isLoading: state is AuthLoading,

                        onPressed: () {
                          final email = emailController.text.trim();

                          final password = passwordController.text.trim();

                          if (email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill all fields"),
                              ),
                            );

                            return;
                          }

                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );

                          if (!emailRegex.hasMatch(email)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Enter a valid email"),
                              ),
                            );

                            return;
                          }

                          context.read<AuthCubit>().login(
                            email: email,
                            password: password,
                          );
                        },
                      );
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Don't have an account? ",

                        style: AppText.regular.copyWith(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            ),
                          );
                        },

                        child: Text(
                          "Create One",

                          style: AppText.regular.copyWith(
                            color: AppColors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(width: 60, height: 1, color: AppColors.yellow),

                      const SizedBox(width: 10),

                      Text(
                        "OR",

                        style: AppText.regular.copyWith(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(width: 60, height: 1, color: AppColors.yellow),
                    ],
                  ),

                  const SizedBox(height: 24),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                                context.read<AuthCubit>().signInWithGoogle();
                              },

                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 55),

                          backgroundColor: AppColors.yellow,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        child: state is AuthLoading
                            ? const CircularProgressIndicator(
                                color: AppColors.black,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  SvgPicture.asset(
                                    AppIcons.googleIcon,
                                    height: 24,
                                  ),

                                  const SizedBox(width: 12),

                                  Text(
                                    "Login With Google",

                                    style: AppText.regular.copyWith(
                                      color: AppColors.black,

                                      fontWeight: FontWeight.w500,

                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedLang = 0;
                              });
                            },

                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedLang == 0
                                      ? AppColors.yellow
                                      : Colors.transparent,

                                  width: 2,
                                ),

                                borderRadius: BorderRadius.circular(50),
                              ),

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),

                                child: CountryFlag.fromCountryCode(
                                  'US',

                                  height: 22,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedLang = 1;
                              });
                            },

                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedLang == 1
                                      ? AppColors.yellow
                                      : Colors.transparent,

                                  width: 2,
                                ),

                                borderRadius: BorderRadius.circular(50),
                              ),

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),

                                child: CountryFlag.fromCountryCode(
                                  'EG',

                                  height: 22,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
