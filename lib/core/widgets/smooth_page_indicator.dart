
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class CustomSmoothPageIndicator extends StatelessWidget {

  final PageController _pageController;
  final int count;

  const CustomSmoothPageIndicator({super.key, required this._pageController, required this.count});
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController, // ✅ نفس الـ Controller
      count: count,
      effect: WormEffect(
        dotColor: AppColors.doteDisappleColor,
        activeDotColor: Colors.black,
        dotWidth: 10.w,
        dotHeight: 10.h,
      ),
    );
  }
}
