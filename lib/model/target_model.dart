
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TargetStatus{
  processing, // 进行中
  complete,   // 已完成
  giveuped,   // 放弃
}
class  TargetModel {

  int? id;
  String? name;
  int? targetDays;
  Color? targetColor;
  String? soundKey;
  List<TimeOfDay>? notificationTimes;
  DateTime? createTime;
  DateTime? deleteTime;
  DateTime? giveupTime;
  TargetStatus? status;




}