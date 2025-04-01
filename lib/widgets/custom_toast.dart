import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static void showToast({
    required String msg,
    Toast? toastLength = Toast.LENGTH_LONG,
    ToastGravity? gravity = ToastGravity.BOTTOM,
    int timeInSecForIosWeb = 3,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength!,
      gravity: gravity!,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
