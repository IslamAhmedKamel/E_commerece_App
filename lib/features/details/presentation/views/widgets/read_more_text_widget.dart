import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreTextWidget extends StatelessWidget {
  const ReadMoreTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: AppStyles.style12(context: context),
      trimMode: TrimMode.Line,
      trimLines: 2,
      isExpandable: true,
      colorClickableText: AppColors.primColor,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: AppStyles.style16(
        context: context,
      ).copyWith(color: AppColors.primColor),
    );
  }
}
