import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/all_featured_list_veiw.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/ads_list.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/all_catygory_items_list.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/searchany_product_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllCategoriesCubit>(context).getData();
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
                              style: AppStyles.style18.copyWith(
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
                    Text("All Featured", style: AppStyles.style18),
                    AllFeaturedListVeiw(),
                    AdsList(),
                    Text("All Products", style: AppStyles.style18),
                  ],
                ),
              ),
              AllCatygoryItemsList(),
            ],
          ),
        ),
      ),
    );
  }
}
