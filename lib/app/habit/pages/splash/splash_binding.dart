
import 'package:flutter_project/app/habit/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{

  @override
  void dependencies() {

    //  注册
    Get.put<SplashController>(SplashController());
  }

}