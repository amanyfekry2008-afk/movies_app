import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/OnBoarding_Screen/model/OnBoarding_model.dart';
import 'package:movies_app/features/OnBoarding_Screen/Widgets/bottom_shet.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<OnboardingModel> onboardingList = [
    OnboardingModel(
      isfirstpage: true,
      button1text: "Explore Now",
      button2text: "",
      isonebutton: true,
      image: AppImages.findYourFavouriteMovie,

      title: "Find Your Next Favorite Movie Here",
      description:
          "Get access to a huge library of movies to suit all tastes. You will surely like it.",
    ),
    OnboardingModel(
      isfirstpage: false,
      button1text: "Next",
      button2text: "",
      isonebutton: true,

      image: AppImages.discoverMore,
      title: "Discover movies",
      description:
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    ),
    OnboardingModel(
      isfirstpage: false,
      button1text: "Next",
      button2text: "Back",
      isonebutton: false,

      image: AppImages.exploreAllGenres,
      title: "Explore All Genres",
      description:
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    ),
    OnboardingModel(
      isfirstpage: false,
      button1text: "Next",
      button2text: "Back",
      isonebutton: false,

      image: AppImages.createWatchLists,
      title: "Create Watchlists",
      description:
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    ),
    OnboardingModel(
      isfirstpage: false,
      button1text: "Next",
      button2text: "Back",
      isonebutton: false,

      image: AppImages.rateReviewLearn,
      title: "Rate, Review, and Learn",
      description:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    ),
    OnboardingModel(
      isfirstpage: false,
      button1text: "Finish",
      button2text: "Back",
      isonebutton: false,

      image: AppImages.startWatchingNow,
      title: "Start Watching Now",
      description: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: pageController,
              itemCount: onboardingList.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        onboardingList[index].image,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Bottom_Sheet(
                        firstindex: onboardingList[index].isfirstpage,
                        isonebutton: onboardingList[index].isonebutton,
                        label: onboardingList[index].title,
                        description: onboardingList[index].description,
                        onPressed1: () {
                          if (index == onboardingList.length - 1) {
                            // navigate to login/home
                            return;
                          }

                          pageController.animateToPage(
                            index + 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                        },
                        onPressed2: () {
                          if (index == 0) return;

                          pageController.animateToPage(
                            index - 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                        },
                        text1: onboardingList[index].button1text,
                        text2: onboardingList[index].button2text,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
