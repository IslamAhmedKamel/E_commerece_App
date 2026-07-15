import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widgets/custom_btn.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_form_sinup.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_rich_text.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_social_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(32),
              Text("Create an account", style: AppStyles.style36),
              Gap(16),
              CustomFormSinup(),
              Gap(16),
              CustomRichText(),
              Gap(16),
              CustomBtn(text: "Create Account"),
              Gap(16),
              Text(
                "- OR Continue with -",
                style: AppStyles.style12.copyWith(
                  color: AppColors.greyDeepColor,
                ),
              ),
              Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CustomSocialContainer(imagePath: AppAssets.googleIcon),
                  Gap(8),
                  CustomSocialContainer(imagePath: AppAssets.appleIcon),
                  Gap(8),
                  CustomSocialContainer(imagePath: AppAssets.facebookIcon),
                ],
              ),
              Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I Already Have an Account ", style: AppStyles.style14),
                  Text(
                    "Login",

                    style: AppStyles.style14.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primColor,
                      color: AppColors.primColor,
                    ),
                  ),
                ],
              ),
              Gap(80),
            ],
          ),
        ),
      ),
    );
  }
}
