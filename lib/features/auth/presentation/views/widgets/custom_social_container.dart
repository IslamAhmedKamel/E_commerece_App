import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomSocialContainer extends StatelessWidget {
  const CustomSocialContainer({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.w,
      height: 54.h,
      decoration: BoxDecoration(
        color: AppColors.greyLightColor,
        border: Border.all(color: AppColors.primColor),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(width: 24.w, height: 24.h, imagePath),
      ),
    );
  }
}
