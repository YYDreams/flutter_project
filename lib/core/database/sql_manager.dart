import 'package:sqflite/sqflite.dart';
import '../../utils/commont_util.dart';

class SqlManager {
//  存储路径
  static const DB_NAME = "room.db";

//  版本号 用来升级数据库
  static const VERSION = 1;

  static Database? dbbase;

//  初始化数据库对象
  static init() async {
    String path = await getDatabasesPath() + '/$DB_NAME';
    dbbase = await openDatabase(path, version: VERSION,
        onCreate: (Database db, int version) {
      print("数据库存储路径$path version:$version");
    });
  }

  //获取当前数据库对象
  static Future<Database> getCurrentDataBase() async {
    if (dbbase == null) {
      await init();
    }
    return dbbase!;
  }

  //判断表是否存在
  static Future<bool> isTableExists(String tableName) async {
    await getCurrentDataBase();
    var res = await dbbase?.rawQuery(
        "select * from sqlite_master where type = 'table' and name = '$tableName'");

    return !ObjectUtil.isEmptyList(res);
  }

  //删除数据库
  static deleteDataBase() async {
    await deleteDataBase();
  }

  // 关闭数据库
  static Future<void> close() async {
    dbbase?.close();
  }
}
