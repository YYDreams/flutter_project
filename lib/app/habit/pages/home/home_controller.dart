
import 'package:get/get.dart';

class HomeController extends GetxController{

  //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("----onInit HomeController");
  }

  //  build准备好了 之后就会执行
  //
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("----onReady HomeController");
    // print("======" + await getDatabasesPath());

  }


}