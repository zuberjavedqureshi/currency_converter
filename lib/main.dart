import 'package:currency_converter_app/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter App',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const WelcomeView(),
    );
  }
}
