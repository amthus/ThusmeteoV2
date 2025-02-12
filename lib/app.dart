// Code de l'application principale 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ThusmeteoV2/app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.dark,
      ),
    );
  }
}