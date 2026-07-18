import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widgets/custom_text.dart';
import 'package:e_commerece_app/features/details/presentation/views/widgets/add_to_cart_row.dart';
import 'package:e_commerece_app/features/details/presentation/views/widgets/custom_images_slider.dart';
import 'package:e_commerece_app/features/details/presentation/views/widgets/custom_product_name_row.dart';
import 'package:e_commerece_app/features/details/presentation/views/widgets/custom_product_price_row.dart';
import 'package:e_commerece_app/features/details/presentation/views/widgets/read_more_text_widget.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this._productModel});
  final ProductModel _productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: AppStyles.style14(context: context),
        ),
        centerTitle: true,
        actions: [
          Badge(label: Text("2"), child: SvgPicture.asset(AppAssets.cartIcon)),
          Gap(16.sp),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomImagesSlider(images: _productModel.images),
                    Gap(16.h),
                    CustomProductNameRow(
                      productName: _productModel.title,
                      productprice: _productModel.price.toString(),
                    ),
                    Gap(16.h),
                    CustomProductPriceRow(productModel: _productModel),
                    Gap(16.h),
                    CustomText(text: "Description"),
                    ReadMoreTextWidget(text: _productModel.description),
                  ],
                ),
              ),
              AddToCartRow(),
              Gap(32.sp),
            ],
          ),
        ),
      ),
    );
  }
}
