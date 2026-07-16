import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/features/splash_feature.dart/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class EcommereceApp extends StatelessWidget {
  const EcommereceApp({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilPlusInit(
      designSize: Size(width, height),
      autoRebuild: false, // 🎯 NEW: Disable automatic tree-wide rebuilds
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: AppConstatn.primFont,
            scaffoldBackgroundColor: Color(0xffF9F9F9),
          ),
          routerConfig: AppRouting.router,
        );
      },
      child: SplashView(),
    );
  }
}
