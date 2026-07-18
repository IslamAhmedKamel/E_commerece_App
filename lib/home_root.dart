import 'dart:developer';

import 'package:e_commerece_app/core/cubit/cubit/bottom_nav_cubit.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/features/cart/views/cart_view_tab.dart';
import 'package:e_commerece_app/features/favorites/presentation/views/favorite_view_tab.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:e_commerece_app/features/home/presentation/views/home_view_tab.dart';
import 'package:e_commerece_app/features/settings/presentation/views/settings_view_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeViewRoot extends StatefulWidget {
  const HomeViewRoot({super.key});

  @override
  State<HomeViewRoot> createState() => _HomeViewRootState();
}

class _HomeViewRootState extends State<HomeViewRoot> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllCategoriesCubit>(context).getData();
    BlocProvider.of<GetAllProductsCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BottomNavCubit, BottomNavState>(
          builder: (context, state) {
            if (state is BottomNavFavoriteView) {
              return FavoriteViewTab();
            } else if (state is BottomNavCartView) {
              return CartViewTab();
            } else if (state is BottomNavSettingsView) {
              return SettingsViewTab();
            } else {
              return HomeViewTab();
            }
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (BuildContext context, BottomNavState state) {
          return Container(
            width: double.infinity,
            height: 54.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,

              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              backgroundColor: Colors.transparent, // <-- لون الخلفية هنا
              iconSize: 20,
              onTap: (value) {
                BlocProvider.of<BottomNavCubit>(
                  context,
                ).onTap(currenIndex: value);
                BlocProvider.of<BottomNavCubit>(context).currentIndex = value;
                log("${BlocProvider.of<BottomNavCubit>(context).currentIndex}");
              },

              currentIndex: BlocProvider.of<BottomNavCubit>(
                context,
              ).currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: true,
              unselectedItemColor: AppColors.greyDeepColor,
              unselectedLabelStyle: TextStyle(color: AppColors.blackColor),
              selectedItemColor: AppColors.primColor,
              // selectedLabelStyle: TextStyle(color: AppColors.primColor),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
