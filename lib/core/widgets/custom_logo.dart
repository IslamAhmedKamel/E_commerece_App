import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class CusstomLogo extends StatelessWidget {
  const CusstomLogo({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.logo, width: width),
        Gap(9),
        Text(
          "Stylish",
          style: AppStyles.style40().copyWith(
            fontFamily: AppConstant.secondFont,
            color: AppColors.primColor,
          ),
        ),
      ],
    );
  }
}
