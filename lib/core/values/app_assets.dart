import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._();
  static const String close = 'assets/icons/close.svg';
  static const String icEmpty = 'assets/icons/ic_empty.svg';
  static const String icHome = 'assets/icons/ic_home.svg';
  static const String icCategory = 'assets/icons/ic_category.svg';
  static const String orders = 'assets/icons/ic_orders.svg';
  static const String icPerson = 'assets/icons/ic_person.svg';

  static const String icNoInternet = 'assets/icons/ic_no_internet.svg';
  static const String logo = 'assets/icons/logo2.svg';

  static const String icSearch = 'assets/icons/icSearch.svg';
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

class AppImages {
  AppImages._();

  static const String imgUzbFlagBig = 'assets/image/img_uzb_flag_big.png';
  static const String icUzFlag = 'assets/image/ic_uzb_flag.png';
  static const String icRusFlag = 'assets/image/ic_rus_flag.png';
  static const String logo = 'assets/image/logo.png';

  static const String icEngFlag = 'assets/image/ic_eng_flag.png';
}
