class OnboardingModel {
  final String image;
  final String title;
  final String description;
  final bool isonebutton;
  final bool isfirstpage;
  final String button1text;
  final String button2text;


  OnboardingModel({
    required this.isfirstpage,
    required this.image,
    required this.title,
    required this.description,
    required this.isonebutton,
    required this.button1text,
    required this.button2text,
  });
}