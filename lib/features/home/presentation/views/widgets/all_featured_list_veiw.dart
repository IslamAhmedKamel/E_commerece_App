import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AllFeaturedListVeiw extends StatelessWidget {
  const AllFeaturedListVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: 87.h,
      child: BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
        builder: (context, state) {
          if (state is GetAllCategoriesSucsecefull) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) =>
                  CategoryItem(categoryModel: state.categories[index]),
            );
          } else if (state is GetAllCategoriesFailure) {
            return Center(
              child: Text(state.errorMessage, style: AppStyles.style12),
            );
          } else if (state is GetAllCategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Gap(0);
        },
      ),
    );
  }
}
