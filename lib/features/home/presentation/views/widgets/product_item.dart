import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/favorites/presentation/view_models/get_favorits_cubit/get_favorits_cubit.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/add_product_to_favorit_cubit/add_product_to_favorit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

// class ProductItem extends StatelessWidget {
//   const ProductItem({super.key, required this._productModel});
//   final ProductModel _productModel;
//   @override
//   Widget build(BuildContext context) {
//     List<ProductModel> productsFavorits = BlocProvider.of<GetFavoritsCubit>(
//       context,
//     ).prods;
//     bool isExisted = productsFavorits.any(
//       (product) => product.id == _productModel.id,
//     );
//     List<String> productsFavoritId = BlocProvider.of<AddProductToFavoritCubit>(
//       context,
//     ).prodsId;
//     bool isAdded = productsFavoritId.any(
//       (productId) => productId == _productModel.id,
//     );

//     log("message$isExisted");
//     return BlocConsumer<AddProductToFavoritCubit, AddProductToFavoritState>(
//       listener: (context, state) {
//         if (state is AddProductToFavoritSucsece) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.green,
//               content: Text(
//                 state.addProductToFavoritModelResponse.message!,
//                 style: AppStyles.style14().copyWith(color: Colors.white),
//               ),
//             ),
//           );
//         } else {}
//       },
//       builder: (context, state) {
//         return GestureDetector(
//           onTap: () {
//             AppNavigator.push(
//               context: context,
//               path: AppRouting.detailsPath,
//               extra: _productModel,
//             );
//           },
//           child: Card(
//             color: Colors.white,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: SizedBox(
//                     height: 150.h,
//                     width: double.infinity,
//                     child: CachedNetworkImage(
//                       height: 150.h,
//                       placeholder: (context, url) =>
//                           Center(child: CircularProgressIndicator()),
//                       imageUrl: _productModel.imageCover,
//                       fit: BoxFit.cover,
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     ),
//                   ),
//                 ),
//                 Gap(8.h),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8.spMin),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         _productModel.title,
//                         maxLines: 2,
//                         style: AppStyles.style10(),
//                       ),
//                       Gap(8.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "EGP ${_productModel.price}",
//                             style: AppStyles.style10(),
//                           ),

//                           BlocBuilder<GetFavoritsCubit, GetFavoritsState>(
//                             builder: (context, state) {
//                               return IconButton(
//                                 padding: EdgeInsets.zero,
//                                 onPressed: () {
//                                   context
//                                       .read<AddProductToFavoritCubit>()
//                                       .addProductToFavorit(
//                                         productId: _productModel.id,
//                                       );
//                                 },
//                                 icon: isAdded || isExisted
//                                     ? Icon(Icons.favorite, color: Colors.red)
//                                     : Icon(Icons.favorite_outline),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Review", style: AppStyles.style10()),
//                           Row(
//                             children: [
//                               Text(
//                                 "(${_productModel.ratingsAverage})",
//                                 style: AppStyles.style10(),
//                               ),
//                               Icon(Icons.star, color: AppColors.yllowColor),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Gap(4.h),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this._productModel});
  final ProductModel _productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductToFavoritCubit, AddProductToFavoritState>(
      builder: (context, state) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      height: 150.h,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      imageUrl: _productModel.imageCover,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                        style: AppStyles.style10(),
                      ),
                      Gap(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EGP ${_productModel.price}",
                            style: AppStyles.style10(),
                          ),
                          // استخدام BlocBuilder واحد يسمع للكيوبتات المطلوبة
                          BlocBuilder<GetFavoritsCubit, GetFavoritsState>(
                            builder: (context, favoritsState) {
                              // حساب isExisted من الحالة الحالية
                              bool isExisted = context
                                  .watch<GetFavoritsCubit>()
                                  .prods
                                  .any(
                                    (product) => product.id == _productModel.id,
                                  );

                              // حساب isAdded من الحالة الحالية
                              bool isAdded = context
                                  .watch<AddProductToFavoritCubit>()
                                  .prodsId
                                  .any(
                                    (productId) =>
                                        productId == _productModel.id,
                                  );

                              return IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: state is AddProductToFavoritLoading
                                    ? null // تعطيل الزر أثناء التحميل
                                    : () {
                                        context
                                            .read<AddProductToFavoritCubit>()
                                            .addProductToFavorit(
                                              productId: _productModel.id,
                                            );
                                      },
                                icon: (isAdded || isExisted)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(Icons.favorite_outline),
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Review", style: AppStyles.style10()),
                          Row(
                            children: [
                              Text(
                                "(${_productModel.ratingsAverage})",
                                style: AppStyles.style10(),
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
      },
    );
  }
}
