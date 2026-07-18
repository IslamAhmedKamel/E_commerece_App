import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomInkTextOnboarding extends StatelessWidget {
  const CustomInkTextOnboarding({
    super.key,
    required this.text,
    this.onTap,
    required this.color,
  });

  final String text;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text, style: AppStyles.style10(context: context).copyWith(color: color)),
    );
  }
}
