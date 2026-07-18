import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomProductNameRow extends StatelessWidget {
  const CustomProductNameRow({
    super.key,
    required this.productName,
    required this.productprice,
  });
  final String productName;
  final String productprice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: CustomText(text: productName)),
        Text(
          "EGP $productprice",
          style: AppStyles.style12(
            context: context,
          ).copyWith(color: AppColors.primColor),
        ),
      ],
    );
  }
}
