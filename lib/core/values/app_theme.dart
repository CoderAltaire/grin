import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grin/core/values/app_colors.dart';

final appThemeData = ThemeData(
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
  fontFamily: "Montserrat",
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.white,
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        height: 1),
    displayMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        height: 1),
    displaySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.grey3,
        height: 1),
    headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.grey4,
        height: 1),
    headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        height: 1),
    headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.grey3,
        height: 1),
    titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        height: 1),
    titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        height: 1),
    titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        height: 1),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        height: 1),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        height: 1),
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grey3,
        height: 1),
  ),
  // fontFamily: 'SFPro',
  scaffoldBackgroundColor: AppColors.white,
  cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.dark),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.red,
  primaryColor: AppColors.primaryColor,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
);
