
import 'package:e_commerece_app/features/home/presentation/featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AllFeaturedListVeiw extends StatelessWidget {
  const AllFeaturedListVeiw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: 87.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) =>
            FeaturedItem(title: "Beauty", image: ''),
      ),
    );
  }
}
