import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widgets/custom_btn.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_form_signin.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_social_container.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/forgot_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.r),
            child: BlocConsumer<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninFailure) {
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
                } else if (state is SigninSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      duration: Duration(microseconds: 2),
                      content: Text(state.userModel.message),
                    ),
                  );

                  CacheHelper.saveData(key: AppConstant.islogin, value: true);
                  AppNavigator.pushReplacement(
                    context: context,
                    path: AppRouting.homePath,
                  );
                }
              },

              builder: (context, state) {
                var signin = context.read<SigninCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(16),
                    Text("Welcome\nBack!", style: AppStyles.style36(context: context)),
                    Gap(24.h),
                    CustomFormSignin(),
                    Gap(12.h),
                    ForgotPasswordWidget(),
                    Gap(32.h),
                    state is SigninLoading
                        ? SizedBox(
                            height: 54.h,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primColor,
                              ),
                            ),
                          )
                        : CustomBtn(
                            text: 'Login',
                            onTap: () {
                              signin.signin();
                            },
                          ),
                    Gap(50.h),

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "- OR Continue with -",

                        style: AppStyles.style12(context: context).copyWith(
                          color: AppColors.greyDeepColor,
                        ),
                      ),
                    ),
                    Gap(12.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSocialContainer(imagePath: AppAssets.googleIcon),
                        Gap(8),
                        CustomSocialContainer(imagePath: AppAssets.appleIcon),
                        Gap(8),
                        CustomSocialContainer(
                          imagePath: AppAssets.facebookIcon,
                        ),
                      ],
                    ),
                    Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Create An Account ", style: AppStyles.style10(context: context)),
                        GestureDetector(
                          onTap: () {
                            AppNavigator.push(
                              context: context,
                              path: AppRouting.sinUpPath,
                            );
                          },
                          child: Text(
                            "Sign Up",

                            style: AppStyles.style14(context: context,).copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primColor,
                              color: AppColors.primColor,
                            ),
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
      ),
    );
  }
}
