import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  static const Color primaryColor = Color.fromARGB(255, 0, 81, 255);
  static const Color secondaryColor = Color.fromARGB(255, 158, 211, 255);
  static const Color backgroundColor = Color.fromARGB(255, 214, 226, 255);
  static const Color textColor = Color(0xff747C87);
  static const Color errorColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF00C853);
  static const Color warningColor = Color(0xFFFFA000);
  static const Color infoColor = Color(0xFF2196F3);
  static const Color scaffoldColor = Color(0xffFAFBFC);
  static const Color navbarColor = Color(0xffFEFEFE);

  //Gradient Colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff3D7CF4),
      // Color.fromARGB(255, 239, 239, 255),
      Color(0xff4D4DE7),
    ],
  );
}
