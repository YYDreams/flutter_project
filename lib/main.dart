// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/index_page.dart';
import 'package:flutter_project/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red, //主题颜色
      ),
      debugShowCheckedModeBanner: false,
      // home:  IndexPage(),
    );
  }
}
