import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this._productModel});
  final ProductModel _productModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.red,
              height: 196.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: _productModel.imageCover,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Gap(8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.spMin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _productModel.title,
                  maxLines: 2,
                  style: AppStyles.style16,
                ),
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("EGP 1,200 ", style: AppStyles.style10),
                    Text(
                      "2000 EGP",

                      style: AppStyles.style10.copyWith(
                        color: AppColors.primColor,

                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.primColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Review", style: AppStyles.style10),
                    Row(
                      children: [
                        Text("(4.6)", style: AppStyles.style10),
                        Icon(Icons.star, color: AppColors.yllowColor),
                      ],
                    ),
                  ],
                ),
                Gap(4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
