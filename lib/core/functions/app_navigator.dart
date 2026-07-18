import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static   void pushReplacement({required BuildContext context,required String path,Object? extra}) {
    GoRouter.of(context).pushReplacement(path,extra: extra);
  }
  static   void push({required BuildContext context,required String path,Object? extra}) {
    GoRouter.of(context).push(path,extra: extra);
  }

}