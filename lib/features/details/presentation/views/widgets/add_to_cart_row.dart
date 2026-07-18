import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

class AddToCartRow extends StatelessWidget {
  const AddToCartRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total price",
              style: AppStyles.style10(context: context).copyWith(fontWeight: FontWeight.bold),
            ),
            Text("EGP 3,500", style: AppStyles.style10(context: context)),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.primColor,
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.cartIcon),
              // Icon(Icons.shopping_cart, color: AppColors.whiteColor),
              Gap(8.w),
              Text(
                "Add to cart",
                style: AppStyles.style10(context: context).copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
