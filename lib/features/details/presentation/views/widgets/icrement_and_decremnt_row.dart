import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

class IncrementAndDecrementRow extends StatelessWidget {
  const IncrementAndDecrementRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.minimizeIcon),
          ),
          Gap(15.w),
          Text(
            "1",
            style: AppStyles.style10(context: context).copyWith(color: AppColors.whiteColor),
          ),
          Gap(15.w),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.plusIcon),
          ),
        ],
      ),
    );
  }
}
