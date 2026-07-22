import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/api_service.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widgets/custom_text.dart';
import 'package:e_commerece_app/features/favorites/presentation/view_models/get_favorits_cubit/get_favorits_cubit.dart';
import 'package:e_commerece_app/features/home/data/home_repo/home_repo_impl.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/add_product_to_favorit_cubit/add_product_to_favorit_cubit.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/all_featured_list_veiw.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/ads_list.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/all_products_list.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/searchany_product_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewTab extends StatefulWidget {
  const HomeViewTab({super.key});

  @override
  State<HomeViewTab> createState() => _HomeViewTabState();
}

class _HomeViewTabState extends State<HomeViewTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetFavoritsCubit>(context).getFavorits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppAssets.menueIcon),

                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.logo, width: 38.r),
                            Gap(9),
                            Text(
                              "Stylish",
                              style: AppStyles.style10().copyWith(
                                fontFamily: AppConstant.secondFont,
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40.w,
                          height: 40.h,
                          child: Image.asset(AppAssets.homeimagetest),
                        ),
                      ],
                    ),
                    Gap(16.h),
                    SearchanyProductTextField(),
                    Gap(16.h),
                    CustomText(text: "All Featured"),
                    AllFeaturedListVeiw(),
                    AdsList(),
                    CustomText(text: "All Products"),
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => AddProductToFavoritCubit(
                  homeRepo: HomeRepoImpl(apiService: ApiService(dio: Dio())),
                ),
                child: AllProductsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
