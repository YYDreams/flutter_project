import 'package:flutter_project/core/database/sql_manager.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class BaseTableProvider {
  String tableName();

  String createTableString();

  //获取数据库对象
  Future<Database> getDataBase() async {
    bool isTableExist = await SqlManager.isTableExists(tableName());
    if (!isTableExist) {
      Database db = await SqlManager.getCurrentDataBase();
      await db.execute(createTableString());
      return db;
    } else {
      return await SqlManager.getCurrentDataBase();
    }
  }

  //创建表
  Future<void> createTable() async{
    bool isTableExist = await SqlManager.isTableExists(tableName());
    if (!isTableExist){
      Database db = await SqlManager.getCurrentDataBase();
     await db.execute(createTableString());
    }
  }

}
