import 'package:e_commerece_app/core/functions/responsve_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AppStyles {
  static TextStyle style10({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 10.sp),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style12({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 12.sp),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style14({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 14.sp),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style16({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 16.sp),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style18({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 18.sp),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle style20({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 20.sp),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style24({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 24.sp),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style36({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 36.sp),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style40({required BuildContext context}) {
    return TextStyle(
      fontSize: getresponsiveFontSize(context: context, fontSize: 40.sp),
      fontWeight: FontWeight.bold,
    );
  }
}
