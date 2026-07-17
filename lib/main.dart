import 'package:e_commerece_app/core/observe.dart';
import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = Observe();
  runApp(const EcommereceApp());
}
