import 'package:covid19_trakcing/binding/default_bind.dart';
import 'package:covid19_trakcing/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: DefaultBinding(),
      title: 'Report Data App',
      debugShowCheckedModeBanner: false,
      theme: kTheme,
      home: HomeScreen(),
    );
  }
}
