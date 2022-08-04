// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/core/database/providers/note_table_provider.dart';
import 'package:flutter_project/core/database/providers/target_table_provider.dart';
import 'package:flutter_project/index_page.dart';
import 'package:flutter_project/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDB();
  runApp(const MyApp());
}

void initDB() async{

 TargetTableProvider targetProvider =   TargetTableProvider();
 NoteTableProvider noteProvider =   NoteTableProvider();
 await targetProvider.createTable();
 await noteProvider.createTable();

}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red, //主题颜色
      ),
      debugShowCheckedModeBanner: false,
      // home:  IndexPage(),
    );
  }
}
