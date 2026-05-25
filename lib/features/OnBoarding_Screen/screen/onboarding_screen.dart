import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/OnBoarding_Screen/Widgets/bottom_sheet.dart';
import 'package:movies_app/features/OnBoarding_Screen/model/OnBoarding_model.dart';
import 'package:movies_app/features/auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      isFirstPage: true,
      button1text: 'Explore Now',
      button2text: '',
      isOneButton: true,
      image: AppImages.findYourFavouriteMovie,
      title: 'Find Your Next Favorite Movie Here',
      description:
      'Get access to a huge library of movies to suit all tastes. You will surely like it.',
    ),

    OnboardingModel(
      isFirstPage: false,
      button1text: 'Next',
      button2text: '',
      isOneButton: true,
      image: AppImages.discoverMore,
      title: 'Discover Movies',
      description:
      'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    ),

    OnboardingModel(
      isFirstPage: false,
      button1text: 'Next',
      button2text: 'Back',
      isOneButton: false,
      image: AppImages.exploreAllGenres,
      title: 'Explore All Genres',
      description:
      'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    ),

    OnboardingModel(
      isFirstPage: false,
      button1text: 'Next',
      button2text: 'Back',
      isOneButton: false,
      image: AppImages.createWatchLists,
      title: 'Create Watch Lists',
      description:
      'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    ),

    OnboardingModel(
      isFirstPage: false,
      button1text: 'Next',
      button2text: 'Back',
      isOneButton: false,
      image: AppImages.rateReviewLearn,
      title: 'Rate, Review, and Learn',
      description:
      'Share your thoughts on the movies you have watched. Dive deep into film details and help others discover great movies with your reviews.',
    ),

    OnboardingModel(
      isFirstPage: false,
      button1text: 'Finish',
      button2text: 'Back',
      isOneButton: false,
      image: AppImages.startWatchingNow,
      title: 'Start Watching Now',
      description: '',
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage(int index) {
    if (index == onboardingList.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );

      return;
    }

    pageController.animateToPage(
      index + 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void previousPage(int index) {
    if (index == 0) return;

    pageController.animateToPage(
      index - 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView.builder(
        controller: pageController,
        physics: const ClampingScrollPhysics(),
        itemCount: onboardingList.length,
        itemBuilder: (context, index) {
          final onboarding = onboardingList[index];

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: Image.asset(
                  onboarding.image,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: OnboardingSheet(
                  isFirstPage: onboarding.isFirstPage,
                  isOneButton: onboarding.isOneButton,
                  label: onboarding.title,
                  description: onboarding.description,
                  text1: onboarding.button1text,
                  text2: onboarding.button2text,
                  onPressed1: () => nextPage(index),
                  onPressed2: () => previousPage(index),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}