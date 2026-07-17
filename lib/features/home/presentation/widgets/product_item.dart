import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      //  borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.productimagetest, fit: BoxFit.fill),
          Gap(8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.spMin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mens Starry", style: AppStyles.style16),
                Gap(4.h),
                Text(
                  "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
                  style: AppStyles.style10,
                ),
                Gap(4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("EGP 1,200 ", style: AppStyles.style10),
                    Text(
                      "2000 EGP",

                      style: AppStyles.style10.copyWith(
                        color: AppColors.primColor,

                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.primColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Review", style: AppStyles.style10),
                    Row(
                      children: [
                        Text("(4.6)", style: AppStyles.style10),
                        Icon(Icons.star, color: AppColors.yllowColor),
                      ],
                    ),
                  ],
                ),
                Gap(4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
