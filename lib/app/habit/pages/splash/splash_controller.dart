
import 'package:get/get.dart';

class SplashController extends GetxController{
  //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("----onInit");
  }

  //  build准备好了 之后就会执行
  //
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("----onReady");
    // print("======" + await getDatabasesPath());

  }



}