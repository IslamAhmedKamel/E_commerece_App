import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/splash_feature.dart/data/onboarding_model.dart';
import 'package:e_commerece_app/features/splash_feature.dart/presentation/views/widgets/custom_ink_text_onboarding.dart';
import 'package:e_commerece_app/features/splash_feature.dart/presentation/views/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController(initialPage: 0);
  List<OnboardingModel> onboardingList = [];
  int currentPage = 0;

  @override
  void initState() {
    onboardingList.addAll(OnboardingModel.onboardingList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Skip",
                textAlign: TextAlign.right,
                style: AppStyles.style18,
              ),
              Expanded(
                child: OnboardingBody(
                  pageController: _controller,
                  onboardingList: onboardingList,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPage == 0
                      ? Gap(2)
                      : CustomInkTextOnboarding(
                          text: 'Prev',
                          color: AppColors.greyColor,
                          onTap: () {
                            setState(() {
                              _controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceIn,
                              );
                              currentPage--;
                            });
                          },
                        ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                      dotColor: AppColors.doteDisappleColor,
                      activeDotColor: Colors.black,
                      dotWidth: 10.w,
                      dotHeight: 10.h,
                    ),
                  ),
                  currentPage == onboardingList.length - 1
                      ? CustomInkTextOnboarding(
                          text: 'Create Account',
                          onTap: () {
                            AppNavigator.pushReplacement(
                              context: context,
                              path: AppRouting.sinUpPath,
                            );
                          },
                          color: AppColors.primColor,
                        )
                      : CustomInkTextOnboarding(
                          text: 'Next',
                          onTap: () {
                            setState(() {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceIn,
                              );
                              currentPage++;
                            });
                          },
                          color: AppColors.primColor,
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
