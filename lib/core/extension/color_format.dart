import 'package:flutter/material.dart';

class ColorFormat {
  const ColorFormat._();
  static  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", ""); 
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; 
    }
    return Color(int.parse("0x$hexColor"));
  }

  
}