import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_icons.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/features/OnBoarding_Screen/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              SvgPicture.asset(AppIcons.filmIcon, height: 253, width: 253),
              Column(
                children: [
                  SvgPicture.asset(AppIcons.routeIcon, height: 76, width: 180),
                  const SizedBox(height: 20),
                  Text('Supervised by Mohamed Nabil', style: AppText.regular),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
