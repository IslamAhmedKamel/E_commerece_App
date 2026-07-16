import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                image: DecorationImage(
                  image: AssetImage(AppAssets.homeimagetest),
                ),
              ),
            ),
            Gap(4.h),
            Text(title, style: AppStyles.style10),
          ],
        ),
      ),
    );
  }
}
