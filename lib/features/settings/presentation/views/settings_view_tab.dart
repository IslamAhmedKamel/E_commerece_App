import 'package:e_commerece_app/core/functions/app_navigator.dart';
import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/core/utils/app_routing.dart';
import 'package:flutter/material.dart';

class SettingsViewTab extends StatelessWidget {
  const SettingsViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: GestureDetector(
          onTap: () async {
            await CacheHelper.removeData(key: AppConstant.tokenKey);
            AppNavigator.pushReplacement(
              context: context,
              path: AppRouting.sinUpPath,
            );
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("log Out"),
          ),
        ),
      ),
    );
  }
}
