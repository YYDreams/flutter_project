import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/habit/pages/splash/splash_controller.dart';
import 'package:flutter_project/utils/color.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController splashController = Get.find<SplashController>();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      //撑开
      fit: StackFit.expand,
      children: [
        PageView.builder(
            itemCount: 2,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Get.height / 2 - (Get.width - 40) / 2 - 50),
                    child: Container(
                      height: Get.width - 40,
                      color: Colors.red,
                    ),
                  ),

                  index == 1
                      ? Container(
                          color:AppColor.bgColor,
                          margin: EdgeInsets.only(top: 50),
                          width: 260,
                          height: 50,

                          child: TextButton(
                            onPressed: () {
                              print("进入首页");
                            },
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5
                                )
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )
                              ),
                                foregroundColor:MaterialStateProperty.all(AppColor.themeColor),
                            ),
                            child: Text("开启自律生活"),

                          ),
                        )
                      :
                  Container(
                    margin: EdgeInsets.only(top: 50,right: 20),
                    child: Text(
                     "远离不良生活习惯",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              );

              // return index == 0 ? Container(color: Colors.orange):Container(
              //   color: Colors.deepOrangeAccent,
              // );
            }),
        Positioned(
            left: 0,
            bottom: MediaQuery.of(context).padding.bottom + 40,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == 0 ? Colors.white : Colors.black45,
                  ),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == 1 ? Colors.white : Colors.black45,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
