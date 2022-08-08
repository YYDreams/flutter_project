import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/commont_util.dart';

enum TargetStatus {
  processing, //  进行中
  completed, //  已完成
  giveuped, //  放弃
}

class TargetModel {
  int? id;

  String? name;

  String? desc;

  int? targetDays;

  Color? targetColor;

  String? soundKey;

  List<TimeOfDay>? notificationTimes;

  DateTime? createTime;

  DateTime? deleteTime;

  DateTime? giveupTime;

  TargetStatus? status;

  //  相当于生成一个新的对象
  TargetModel clone() {
    return TargetModel()
      ..id = id
      ..name = name
      ..desc = desc
      ..targetColor = targetColor
      ..soundKey = soundKey
      ..notificationTimes = List.from(notificationTimes ?? [])
      ..createTime = createTime
      ..deleteTime = deleteTime
      ..giveupTime = giveupTime
      ..status = status;
  }

  //  将从数据库目标表中国查询的目标map转换为TargetModel类对象
  static TargetModel? targetFromMap(Map<String, dynamic> map) {

    if (ObjectUtil.isEmptyMap(map)) {return null;}
    Color? color;
    String? colors = map["t_colors"];
    if (!ObjectUtil.isEmptyString(colors)){

    }

    return TargetModel()
     ..id  = map["id"]
      ..name =  map["t_name"]
      ..targetDays = map["t_days"]
     ..soundKey = map["t_sound_key"]
    ;




  }
}

