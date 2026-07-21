import 'package:e_commerece_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomProductNameRow extends StatelessWidget {
  const CustomProductNameRow({super.key, required this.productName});
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: CustomText(text: productName)),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}
