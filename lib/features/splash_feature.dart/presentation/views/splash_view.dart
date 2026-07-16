import 'dart:async';

import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool? isVisited = CacheHelper.getDataBool(
      key: AppConstatn.isVisitedOnboarding,
    );
    Timer(Duration(seconds: 4), () {
      // ✅ استخدم getDataBool
      if (isVisited == true) {
        AppNavigator.pushReplacement(
          context: context,
          path: AppRouting.sinUpPath,
        );
      } else {
        AppNavigator.pushReplacement(
          context: context,
          path: AppRouting.onBoardingPath,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.logo, width: 124.r),
              Gap(9),
              Text(
                "Stylish",
                style: AppStyles.style40.copyWith(
                  fontFamily: AppConstatn.secondFont,
                  color: AppColors.primColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
