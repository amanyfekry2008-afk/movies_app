import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/OnBoarding_Screen/screen/onBoarding_Screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return OnboardingScreen();
      }));
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
              SizedBox(),
              Image.asset(AppImages.filmicon, height: 253, width: 253),
              Column(
                children: [
                  Image.asset(
                    AppImages.route,
                    height: 76,
                    width: 180,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Supervised by Mohamed Nabil",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.white,

                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
