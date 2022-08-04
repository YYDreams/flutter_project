import 'package:flutter/material.dart';
import 'app/douban/pages/home/home_page.dart';
import 'app/douban/pages/mine/mine_page.dart';
import 'app/douban/pages/douban/douban_page.dart';
import 'app/douban/pages/market/market_page.dart';
import 'app/douban/pages/group/group_page.dart';
import 'utils/Macros/constant.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var currentIndex = 0;

  //底部tabbar
  final List<BottomNavigationBarItem> bottomTabs = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.red,
      ),
      label: "首页",
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.menu_book_sharp,
          color: Colors.red,
        ),
        label: "书影音"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.group,
          color: Colors.red,
        ),
        label: "小组"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sms_failed_outlined,
          color: Colors.red,
        ),
        label: "市集"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        label: "我的"),
  ];

  //
  final List<Widget> pages = [
    const HomePage(),
    const DouBanPage(),
    const GroupPage(),
    const MarketPage(),
    const MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: bottomTabs,
          selectedItemColor: Constant.theme,
          unselectedItemColor: Colors.black,
          currentIndex: currentIndex,
          onTap: (index) {
            print("object======$index");
            setState(() {
              currentIndex = index;
            });
          }),
      body: pages[currentIndex],
    );
  }
}
