import 'package:flutter/material.dart';

var drawerPadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

abstract class TextStyles {

  static final TextStyle drawerHeaderTextStyle = TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle drawerSectionTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle drawerCurrentSectionTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.blueAccent,
    fontWeight: FontWeight.normal,
  );
}

abstract class RGBColors {
  
  static final drawerColor = Colors.blue.shade100.withOpacity(0.3);
  static const drawerIconColor = Colors.black87;
  
}