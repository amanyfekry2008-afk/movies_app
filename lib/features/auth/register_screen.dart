import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedAvatar = 0;

  final List<String> avatars = [
    AppImages.avatar,
    AppImages.avatar,
    AppImages.avatar,
  ];

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
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.yellow,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final bool isSelected = selectedAvatar == index;
                      return GestureDetector(
                        onTap: () => setState(() => selectedAvatar = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: isSelected ? 95 : 75,
                          height: isSelected ? 95 : 75,
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

                const Center(
                  child: Text(
                    "Avatar",
                    style: TextStyle(color: AppColors.white, fontSize: 13),
                  ),
                ),

                const SizedBox(height: 25),

                const CustomTextField(
                  hintText: "Full Name",
                  prefixIcon: Icons.badge_outlined,
                ),

                const SizedBox(height: 15),

                const CustomTextField(
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 15),

                const CustomTextField(
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: AppColors.white,
                  ),
                ),

                const SizedBox(height: 15),

                const CustomTextField(
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: AppColors.white,
                  ),
                ),

                const SizedBox(height: 15),

                const CustomTextField(
                  hintText: "Phone Number",
                  prefixIcon: Icons.phone_outlined,
                ),

                const SizedBox(height: 25),

                CustomButton(text: "Create Account", onPressed: () {}),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: AppColors.yellow),
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

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
