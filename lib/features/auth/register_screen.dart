import 'package:country_flags/country_flags.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

import 'package:movies_app/features/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedAvatar = 0;

  bool isPasswordHidden = true;

  bool isConfirmHidden = true;

  int selectedLang = 0;

  final List<String> avatars = [
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
  ];

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
                  final uid = FirebaseAuth.instance.currentUser!.uid;

                  context.read<AuthCubit>().getUser(uid);

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

                      const SizedBox(width: 8),

                      Text(
                        "Register",

                        style: AppText.title.copyWith(
                          color: AppColors.yellow,

                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: List.generate(3, (index) {
                        final isSelected = selectedAvatar == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAvatar = index;
                            });
                          },

                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),

                            curve: Curves.easeOut,

                            margin: const EdgeInsets.symmetric(horizontal: 8),

                            width: isSelected ? width * 0.22 : width * 0.18,

                            height: isSelected ? width * 0.22 : width * 0.18,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              border: Border.all(
                                color: isSelected
                                    ? AppColors.yellow
                                    : Colors.transparent,

                                width: 2.5,
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(3),

                              child: CircleAvatar(
                                backgroundImage: AssetImage(avatars[index]),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Avatar",

                    textAlign: TextAlign.center,

                    style: AppText.regular.copyWith(fontSize: 14),
                  ),

                  const SizedBox(height: 24),

                  CustomTextField(
                    controller: nameController,

                    hintText: "Full Name",

                    prefixIcon: Icons.badge_outlined,
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: emailController,

                    hintText: "Email",

                    prefixIcon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: passwordController,

                    hintText: "Password",

                    prefixIcon: Icons.lock_outline,

                    obscureText: isPasswordHidden,

                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,

                        color: AppColors.white,
                      ),

                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: confirmPasswordController,

                    hintText: "Confirm Password",

                    prefixIcon: Icons.lock_outline,

                    obscureText: isConfirmHidden,

                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmHidden
                            ? Icons.visibility_off
                            : Icons.visibility,

                        color: AppColors.white,
                      ),

                      onPressed: () {
                        setState(() {
                          isConfirmHidden = !isConfirmHidden;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: phoneController,

                    hintText: "Phone Number",

                    prefixIcon: Icons.phone_outlined,
                  ),

                  const SizedBox(height: 24),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: "Create Account",

                        isLoading: state is AuthLoading,

                        onPressed: () {
                          if (emailController.text.trim().isEmpty ||
                              passwordController.text.trim().isEmpty ||
                              nameController.text.trim().isEmpty ||
                              phoneController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill all fields"),
                              ),
                            );

                            return;
                          }

                          final phone = phoneController.text.trim();

                          if (phone.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Enter phone number"),
                              ),
                            );

                            return;
                          }

                          if (!RegExp(r'^01[0-9]{9}$').hasMatch(phone)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Enter valid Egyptian phone number",
                                ),
                              ),
                            );

                            return;
                          }

                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Passwords don't match"),
                              ),
                            );

                            return;
                          }

                          context.read<AuthCubit>().register(
                            name: nameController.text.trim(),

                            email: emailController.text.trim(),

                            password: passwordController.text.trim(),

                            phone: phoneController.text.trim(),

                            avatar: selectedAvatar,
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Already have an account? ",

                        style: AppText.regular.copyWith(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },

                        child: Text(
                          "Login",

                          style: AppText.regular.copyWith(
                            color: AppColors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),

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
