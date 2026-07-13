import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/features/splash_feature.dart/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class EcommereceApp extends StatelessWidget {
  const EcommereceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(390, 844),
      autoRebuild: false, // 🎯 NEW: Disable automatic tree-wide rebuilds
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouting.router,
        );
      },
      child: SplashView(),
    );
  }
}
