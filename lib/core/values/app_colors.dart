import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const primaryColor = Color(0xFFFF2D9A);
  static const primaryColorOpacity = Color.fromARGB(255, 254, 239, 247);
  static const lightGray = Color(0xFFE4E4E4);
  static const grey3 = Color(0xFF898E96);
  static const grey5 = Color(0xFF374957);
  static const grey2 = Color(0xFFCCCDCE);
  static const grey1 = Color(0xFFE7E9EC);
  static const grey4 = Color(0xFF393F48);
  static const grey6 = Color(0xFF898E96);
  static const secondary = Color(0xFFF1F1F1);
  static const secondary2 = Color(0xFFF8F8FA);
  static const green = Color(0xFF02A644);
  static const blue = Color.fromARGB(255, 7, 76, 132);
  static const blue1 = Color(0xff374957);
  static const white = Colors.white;
  static const red = Colors.red;
  static const amber = Colors.amber;
  static const whiteBlue = Colors.blue;

//Blcak colors
  static const black = Colors.black;
  static const black1 = Color(0xFF313131);
  static const black2 = Color(0xFF353535);

  static const transparent = Colors.transparent;
  static const mainGradient = LinearGradient(
    begin: Alignment(-0.05, -1.00),
    end: Alignment(0.05, 1),
    colors: [
      primaryColor,
      red,
    ],
  );
}
