import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/root.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  


  //test firebase
  runApp(const EcommereceApp());
}
