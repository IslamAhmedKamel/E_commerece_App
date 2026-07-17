import 'package:e_commerece_app/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class AllCatygoryItemsList extends StatelessWidget {
  const AllCatygoryItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 2.1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) => ProductItem(),
    );
  }
}
