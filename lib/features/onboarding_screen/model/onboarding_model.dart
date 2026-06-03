class OnboardingModel {
  final String image;
  final String title;
  final String description;
  final bool isOneButton;
  final bool isFirstPage;
  final String primaryButtonText;
  final String secondaryButtonText;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
    required this.isOneButton,
    required this.isFirstPage,
    required this.primaryButtonText,
    required this.secondaryButtonText,
  });
}