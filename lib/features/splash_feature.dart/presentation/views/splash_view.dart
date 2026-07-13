import 'dart:async';

import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement(AppRouting.onBoardingPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                AppAssets.splashlinesimage,
                width: double.infinity,
                // height: 627,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  AppAssets.splashlogo,
                  width: 133,
                  height: 133,
                ),
              ),
            ],
          ),
          Gap(120),

          CircularProgressIndicator(color: Color(0xffB3B3B3)),
          Gap(66),
        ],
      ),
    );
  }
}
