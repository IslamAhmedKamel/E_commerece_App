import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widgets/custom_btn.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/forgot_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.dm),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Forgot\npassword?", style: AppStyles.style36),
                Gap(32.h),
                forgotForm(),
                Gap(24.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "*",
                      style: AppStyles.style12.copyWith(
                        color: AppColors.primColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        " We will send you a message to set or reset your new password",
                        style: AppStyles.style12,
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                CustomBtn(text: "Submit"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
