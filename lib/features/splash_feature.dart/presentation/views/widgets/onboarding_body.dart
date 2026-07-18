// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/splash_feature.dart/data/onboarding_model.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    this._pageController, this.onPageChanged, required this.onboardingList,
  });
final PageController? _pageController;
final void Function(int)? onPageChanged;
final List<OnboardingModel> onboardingList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged:onPageChanged,
        controller:_pageController ,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 233,
                child: Image.asset(onboardingList[index].image,height: 300.h,width: 300.w,),
              ),
              Gap(6),
              Text(
                OnboardingModel.onboardingList[index].title,
                style: AppStyles.style10(context: context),
              ),
              Text(
                OnboardingModel.onboardingList[index].subTitle,
                textAlign: TextAlign.center,
                style: AppStyles.style14(context: context).copyWith(color: AppColors.greyColor),
              ),
            ],
          );
        },
        itemCount: OnboardingModel.onboardingList.length,
      ),
    );
  }
}
