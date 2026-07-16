import 'dart:developer';

import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widgets/custom_btn.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_form_sinup.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_rich_text.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_social_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var signUp = context.watch<SignupCubit>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.r),
        child: SingleChildScrollView(
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    duration: Duration(seconds: 2),
                    content: Text(state.errMessage),
                  ),
                );
                log(state.errMessage);
              } else if (state is SignupSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    duration: Duration(microseconds: 300),
                    content: Text(state.userModel.token),
                  ),
                );
                AppNavigator.pushReplacement(
                  context: context,
                  path: AppRouting.signInPath,
                );
              }
            },

            builder: (context, state) {
              return Column(
                children: [
                  Gap(32),
                  Text("Create an account", style: AppStyles.style36),
                  Gap(16),
                  CustomFormSinup(),
                  Gap(16),
                  CustomRichText(),
                  Gap(12),
                  state is SignupLoading
                      ? SizedBox(
                          height: 54.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primColor,
                            ),
                          ),
                        )
                      : CustomBtn(
                          text: 'Sign Up',
                          onTap: () {
                            signUp.signUp();
                          },
                        ),
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
                      Text(
                        "I Already Have an Account ",
                        style: AppStyles.style14,
                      ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
