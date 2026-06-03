class OnboardingModel {
  final String image;
  final String title;
  final String description;
  final bool isOneButton;
  final bool isFirstPage;
  final String button1text;
  final String button2text;


  OnboardingModel({
    required this.isFirstPage,
    required this.image,
    required this.title,
    required this.description,
    required this.isOneButton,
    required this.button1text,
    required this.button2text,
  });
}