import 'package:flutter/material.dart';
import 'package:pawfect/screens/loginScreen.dart';
import 'package:pawfect/screens/splashScreen.dart';
import 'package:get/get.dart';
import 'package:pawfect/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: yellow),
        useMaterial3: true,
      ),
      home: splashScreen(),
    );
  }
}



