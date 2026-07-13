import 'package:flutter/material.dart';

class EcommereceApp extends StatelessWidget {
  const EcommereceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Color(0xff1A1A1A))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
