import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/features/details/presentation/views/widgets/icrement_and_decremnt_row.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CustomProductPriceRow extends StatelessWidget {
  const CustomProductPriceRow({super.key, required this._productModel});
  final ProductModel _productModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.greyColor),
          ),
          child: Text("${_productModel.price} Sold"),
        ),
        Row(
          children: [
            Icon(Icons.star, color: AppColors.yllowColor),
            Text("${_productModel.ratingsAverage}"),
            Text("(${_productModel.ratingsQuantity  })"),
          ],
        ),
        IncrementAndDecrementRow(),
      ],
    );
  }
}
