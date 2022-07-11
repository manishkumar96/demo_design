import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/ui/bottombar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      // home: BottomBarScreen(),
      home: BottomBarScreen(),
    );
  }
}
