import 'dart:async';

import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

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
    bool? islogin = CacheHelper.getDataBool(key: AppConstatn.islogin);
    Timer(Duration(seconds: 4), () {
      // ✅ استخدم getDataBool
      if (isVisited == true) {
        if (islogin == true) {
          AppNavigator.pushReplacement(
            context: context,
            path: AppRouting.homePath,
          );
        } else {
          AppNavigator.pushReplacement(
            context: context,
            path: (AppRouting.sinUpPath),
          );
        }
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
        children: [CusstomLogo(width: 124.r)],
      ),
    );
  }
}
