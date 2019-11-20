import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart' as toast;

/// Toast调用类
class Toast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(String msg, BuildContext context,
      {int duration = 1,
      int gravity = 0,
      Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      double backgroundRadius = 20,
      Border border}) {
    if (null != context) {
      toast.Toast.show(msg, context,
          duration: duration,
          gravity: gravity,
          backgroundColor: backgroundColor,
          textColor: textColor,
          backgroundRadius: backgroundRadius,
          border: border);
    }
  }
}
