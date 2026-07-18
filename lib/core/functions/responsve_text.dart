import 'package:flutter/material.dart';

double getScaleFactory({required BuildContext context}) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

double getresponsiveFontSize({
  required BuildContext context,
  required double fontSize,
}) {
  double scalefactory = getScaleFactory(context: context);
  double responsiveFontSize = fontSize * scalefactory;
  double lowerLimit = fontSize * 0.6;
  double upperLimit = fontSize * 2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
