// 抽象类
import 'package:flutter_project/app/habit/pages/splash/splash_binding.dart';
import 'package:get/route_manager.dart';

import '../pages/splash/splash_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH, page: () => SplashPage(),binding: SplashBinding()),
  ];
}

// 命名路由
abstract class Routes {
  //  initial
  static const INITIAL = "/";
  //  闪屏页
  static const SPLASH = "/splash";
  //  首页
  static const HOME = "/home";
}
