import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/favorites/presentation/view_models/get_favorits_cubit/get_favorits_cubit.dart';
import 'package:e_commerece_app/features/favorites/presentation/views/widgets/favorit_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteViewTab extends StatelessWidget {
  const FavoriteViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Favorits Products ", style: AppStyles.style14()),
                Badge(
                  label: Text("2"),
                  child: SvgPicture.asset(AppAssets.cartIcon),
                ),
              ],
            ),
            Gap(32.h),
            BlocBuilder<GetFavoritsCubit, GetFavoritsState>(
              builder: (context, state) {
                if (state is GetFavoritsSuceces) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) =>
                          FavoritProduct(productModel: state.products[index]),
                    ),
                  );
                } else if (state is GetFavoritsFailur) {
                  return Expanded(
                    child: Center(child: Text(state.errorMessage)),
                  );
                } else if (state is GetFavoritsLoading) {
                  return Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Gap(0.0);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
