import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../core/utils/app_colors.dart';
import 'register_screen.dart';
import 'reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                const SizedBox(height: 20),

                Center(
                  child: Image.asset(
                    AppImages.logoApp,
                    height: 140,
                    width: 140,
                  ),
                ),

                const SizedBox(height: 40),

                const CustomTextField(
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 20),

                const CustomTextField(
                  hintText: "Password",
                  prefixIcon: Icons.lock_outlined,
                  obscureText: true,
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: AppColors.white,
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
                          builder: (context) => const ResetPasswordScreen(),
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

                CustomButton(text: "Login", onPressed: () {}),

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
                            builder: (context) => const RegisterScreen(),
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
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(width: 60, height: 1, color: AppColors.yellow),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.g_mobiledata,
                          color: AppColors.black,
                          size: 35,
                        ),

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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CountryFlag.fromCountryCode(
                            'US',
                            height: 22,
                            width: 22,
                          ),
                        ),

                        const SizedBox(width: 10),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CountryFlag.fromCountryCode(
                            'EG',
                            height: 22,
                            width: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
