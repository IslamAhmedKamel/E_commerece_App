import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static   void pushReplacement({required BuildContext context,required String path}) {
    GoRouter.of(context).pushReplacement(path);
  }
  static   void push({required BuildContext context,required String path}) {
    GoRouter.of(context).push(path);
  }

}