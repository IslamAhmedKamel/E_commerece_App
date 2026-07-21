import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.primColor,
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.style20().copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
