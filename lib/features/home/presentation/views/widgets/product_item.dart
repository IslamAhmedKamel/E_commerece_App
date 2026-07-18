import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
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
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context: context,
          path: AppRouting.detailsPath,
          extra: _productModel,
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 196.h,
                width: double.infinity,
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
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
                    style: AppStyles.style10(context: context),
                  ),
                  Gap(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${_productModel.price}",
                        style: AppStyles.style10(context: context),
                      ),
                      Text(
                        "${_productModel.quantity} EGP",

                        style: AppStyles.style10(context: context).copyWith(
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
                      Text(
                        "Review",
                        style: AppStyles.style10(context: context),
                      ),
                      Row(
                        children: [
                          Text(
                            "(${_productModel.ratingsAverage})",
                            style: AppStyles.style10(context: context),
                          ),
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
      ),
    );
  }
}
