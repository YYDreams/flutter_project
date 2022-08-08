

import 'base_table_provider.dart';

class NoteTableProvider extends BaseTableProvider{

  final String tablename = "note";

  //表里面的列名
  final String columnId = 'id';
  final String columnTargetId = 'target_id'; //关联目标表
  final String columnNote = 'note';
  final String columnCreateTime = 'n_createtime';

  @override
  String createTableString() {
    //备注  最后一个不能写逗号 否则会导致数据库报错
    return '''CREATE TABLE $tablename (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnTargetId INTEGER NOT NULL,
    $columnNote TEXT NOT NULL,
    $columnCreateTime TEXT NOT NULL
    )
    ''';
  }

  @override
  String tableName() {
    return tablename;
  }

}