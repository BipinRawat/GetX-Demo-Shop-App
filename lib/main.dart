import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagement/model/translation.dart';
import 'package:getx_statemanagement/views/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      title: 'GETX MANAGEMENT',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ProductScreen(),
    );
  }
}
