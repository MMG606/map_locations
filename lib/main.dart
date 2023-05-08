import 'package:flutter/material.dart';
import 'package:map_locations/Bindings/getx_bindings.dart';
import 'package:get/get.dart';
import 'package:map_locations/Screens/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
