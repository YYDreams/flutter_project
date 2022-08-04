import 'package:flutter/material.dart';
import 'package:flutter_project/app/douban/widget/common_search_navbar.dart';
import 'package:flutter_project/utils/Macros/constant.dart';
import 'package:flutter_project/widget/toast.dart';

import '../../network/network_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchNavBar(),
        body: InkWell(
          child: Container(
            height: 100,
            width: 100,
            child: Text("点我"),

          ),
          onTap: (){
             requestData();
          },
        ),
      ),

    );
  }
  void requestData(){

    Map<String, dynamic> query = {
      "type": "top",
      "key": "e7298127f641182ecd04828e680ceb55"
    };
    NetworkBaseRequest.instance.request(Method.get, "/toutiao/index",params: query, onSuccess: (result){
      print("object 请求成功");
    }, onError: (errCode,msg){
      print("object 请求失败");
    });

  }
}
