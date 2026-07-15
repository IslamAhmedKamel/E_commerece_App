import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CustomFormSinup extends StatelessWidget {
  const CustomFormSinup({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            hintText: "Username or Email",
            keyboardType: TextInputType.emailAddress,
          ),
          Gap(16),
          CustomTextField(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {},
              color: AppColors.greyHintTextFormColor,
            ),
          ),
          Gap(16),
          CustomTextField(
            hintText: "ConfirmPassword",
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {},
              color: AppColors.greyHintTextFormColor,
            ),
          ),
          Gap(16),
          CustomTextField(
            prefixIcon: Icon(Icons.phone_android),
            hintText: "Mobile",
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
