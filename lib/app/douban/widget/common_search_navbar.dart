import 'package:flutter/material.dart';

class SearchNavBar extends StatelessWidget implements PreferredSizeWidget {
  // const SearchNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,


          children: [

            // 个人中心
            InkWell(
              child: Icon(Icons.menu),
              onTap: () {
                print("菜单");

              },
            ),

            // 搜索
            Container(
              width: 200,
              height: 40,
              color: Colors.green,
              child:
              TextField(decoration: InputDecoration(
                labelText: "",
                hintText: "请输入关键词"
              ), ),

            ),

            // 消息
            InkWell(
              child: Icon(Icons.message_rounded),
              onTap: () {
                print("消息");
              },
            )
          ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(44);
}
