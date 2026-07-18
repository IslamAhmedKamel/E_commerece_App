
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchanyProductTextField extends StatelessWidget {
  const SearchanyProductTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Color(0xffFFFFFF).withValues(alpha: 0.4),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.greyHomeColor,
          ),
          suffixIcon: Icon(
            Icons.mic_none_rounded,
            color: AppColors.greyHomeColor,
          ),
          hint: Text(
            "Search any Product..",
            style: AppStyles.style10(context: context).copyWith(
              fontWeight: FontWeight(400),
              color: AppColors.greyHomeColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
    
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
    
        //
      ),
    );
  }
}
