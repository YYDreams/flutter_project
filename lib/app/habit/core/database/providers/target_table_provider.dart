

import 'base_table_provider.dart';

class TargetTableProvider extends BaseTableProvider {

  final String tablename = "target";

  //表里面的列名
  final String columnId = 'id';
  final String columnTargetName = 't_name';
  final String columnTargetDays = 't_days';
  final String columnTargetColors = 't_colors';
  final String columnTargetSoundKey = 't_sound_key';
  final String columnTargetNotificationTimes = 't_notification_times';
  final String columnTargetCurrentTime = 't_currenttime';
  final String columnTargetDeleteTime = 't_deletetime';
  final String columnTargetGiveupTime = 't_giveuptime';


  @override
  String tableName() {
    return tablename;
  }
  @override
  String createTableString() {
    return '''CREATE TABLE $tablename (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnTargetName TEXT NOT NULL,
    $columnTargetDays INTEGER NOT NULL, 
    $columnTargetColors TEXT,
    $columnTargetSoundKey TEXT NOT NULL,
    $columnTargetNotificationTimes TEXT,
    $columnTargetCurrentTime TEXT NOT NULL,
    $columnTargetDeleteTime TEXT,
    $columnTargetGiveupTime TEXT)''';
  }


  //  插入数据 inset

  //  查询数据 select

  //  更新数据 update

}
