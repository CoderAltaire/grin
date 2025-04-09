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
  static const String icVector = 'assets/icons/vector.png';

  //---------------------png images --------------------
  static const Icon icEye_off = Icon(Icons.visibility_off);
  static const Icon icEye = Icon(Icons.visibility);
  static const String ic_home = 'assets/icons/home.png';
  static const String ic_course = 'assets/icons/book.png';
  static const String ic_certificate = 'assets/icons/certificate.png';
  static const String ic_settinges = 'assets/icons/setting.png';
  static const String ic_play_button = 'assets/icons/play_circle.png';
}

// extension SvgExt on String {
//   SvgPicture svg({
//     Color? color,
//     double? width,
//     double? height,
//   }) {
//     return SvgPicture.asset(
//       this,
//       colorFilter:
//           color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
//       width: width,
//       height: height,
//       fit: BoxFit.cover,
//     );
//   }
// }

class AppImages {
  AppImages._();
  // static const String profileimage = 'assets/images/profile_image.png';
  static const String grin_uz_logo = 'assets/images/grin_logo.png';
  static const String imgArbFlag = 'assets/images/arabic_flag.png';
  static const String imgEngFlag = 'assets/images/england_flag.png';
  static const String imgKorFlag = 'assets/images/korean_flag.png';
  static const String imgUzbFlagBig = 'assets/images/uzb_flag_big.png';
  static const String icUzFlag = 'assets/images/ic_uzb_flag.png';
  static const String icRusFlag = 'assets/images/ic_rus_flag.png';
  static const String logo = 'assets/images/logo.png';
  static const String icEngFlag = 'assets/images/ic_eng_flag.png';
  static const String lesson1 = 'assets/images/lessons1.png';
  static const String no_photo = 'assets/images/no_photo.png';
}
