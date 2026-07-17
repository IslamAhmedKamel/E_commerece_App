import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CacheHelper.saveData(key: AppConstant.isVisitedOnboarding, value: true);
        AppNavigator.pushReplacement(
          context: context,
          path: AppRouting.sinUpPath,
        );
      },
      child: Text("Skip", textAlign: TextAlign.right, style: AppStyles.style18),
    );
  }
}
