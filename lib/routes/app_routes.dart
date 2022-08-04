// 抽象类
// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter_project/pages/splash/splash_page.dart';
import 'package:get/route_manager.dart';

abstract class AppPages {
  static final pages = [GetPage(name: Routes.SPLASH, page: () => SplashPage())];
}

// 命名路由
abstract class Routes {
  // initial
  static const INITIAL = "/";
  //闪屏页
  static const SPLASH = "/splash";
}
