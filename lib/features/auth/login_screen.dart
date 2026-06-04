import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/layout/layout_screen.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../core/utils/app_colors.dart';
import 'controllers/auth_controllers.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/auth_state.dart';
import 'register_screen.dart';
import 'reset_password_screen.dart';

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
                        builder: (_) => const LayoutScreen(),
                      ),
                    );
                  }

                  if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },

                child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                          const SizedBox(height: 20),

                      Center(
                        child: Image.asset(
                          AppImages.logoApp,
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                      ),

                      const SizedBox(height: 40),

                      CustomTextField(
                        controller: emailController,
                        hintText: "Email",
                        prefixIcon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 20),

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

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ResetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: AppColors.yellow),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

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

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: AppColors.white.withValues(alpha: 0.7),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Create One",
                                style: TextStyle(color: AppColors.yellow),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 60, height: 1, color: AppColors.yellow),
                            const SizedBox(width: 10),
                            const Text(
                              "OR",
                              style: TextStyle(color: AppColors.yellow),
                            ),
                            const SizedBox(width: 10),
                            Container(width: 60, height: 1, color: AppColors.yellow),
                          ],
                        ),

                        const SizedBox(height: 20),

                        BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: ElevatedButton(
                                      onPressed: state is AuthLoading
                                          ? null
                                          : () {
                                        context
                                            .read<AuthCubit>().signInWithGoogle();
                                      },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.yellow,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: state is AuthLoading
                                        ? const CircularProgressIndicator(
                                      color: AppColors.black,
                                    )
                                        : const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.g_mobiledata,
                                            color: AppColors.black, size: 35),
                                        SizedBox(width: 5),
                                        Text(
                                          "Login With Google",
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              );
                            },
                        ),

                        const SizedBox(height: 30),

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
                            setState(() => selectedLang = 0);
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
                                  setState(() => selectedLang = 1);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedLang == 1
                                                ? AppColors.yellow: Colors.transparent,
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
