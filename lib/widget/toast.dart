import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(
  String msg, {
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.CENTER,
    backgroundColor: backgroundColor,
    textColor: textColor,
    timeInSecForIosWeb: 1,
    fontSize: 16.0,
  );
}
