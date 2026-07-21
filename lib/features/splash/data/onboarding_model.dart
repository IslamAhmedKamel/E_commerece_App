import 'package:e_commerece_app/core/utils/app_assets.dart';

class OnboardingModel {
  final String image;
  final String subTitle;
  final String title;

  const OnboardingModel({
    required this.image,
    required this.subTitle,
    required this.title,
  });
  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      subTitle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      title: "Choose Products",
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      subTitle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      title: "Make Payment",
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      subTitle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      title: "Get Your Order",
    ),
  ];
}
