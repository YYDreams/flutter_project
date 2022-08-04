import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      //撑开
      fit: StackFit.expand,
      children: [
        PageView.builder(
            itemCount: 2,
            onPageChanged: (index){
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder:(BuildContext context, int index){
          return index == 0 ? Container(color: Colors.orange):Container(
            color: Colors.deepOrangeAccent,
          );
        }),
        Positioned(left: 0,bottom: MediaQuery.of(context).padding.bottom+40,right: 0,
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
            ) ,
          ),

          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == 1 ? Colors.white : Colors.black45,
            ) ,
          ),
        ],))
      ],

    );
  }
}
