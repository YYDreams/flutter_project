
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings{


  @override
  void dependencies() {
    //  注册
    Get.put<HomeController>(HomeController());
  }
}