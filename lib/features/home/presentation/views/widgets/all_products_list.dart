import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:e_commerece_app/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductsList extends StatelessWidget {
  const AllProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsLoading) {
          return SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is GetAllProductsFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(state.errorMessage, style: AppStyles.style12),
            ),
          );
        } else if (state is GetAllProductsSucsecefull) {
          return SliverGrid.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) =>
                ProductItem(productModel: state.products[index]),
          );
        } else {
          return SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
