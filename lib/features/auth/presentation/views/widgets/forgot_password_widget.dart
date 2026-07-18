import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context: context, path: AppRouting.forgotPath);
      },
      child: Align(
        alignment: AlignmentGeometry.centerEnd,
        child: Text(
          "Forgot Password?",
          style: AppStyles.style10(context: context).copyWith(color: AppColors.primColor),
        ),
      ),
    );
  }
}
