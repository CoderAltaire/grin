// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';
import 'package:flutter/material.dart';
import 'package:grin/core/utils/log_service.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class MyFunctions {
  /// Prints information about the error.
  ///
  /// This will print the file path and the actual error text.
  ///
  /// The file path is the path to the file where the error occurred.
  /// It will be in the format of package:bir_qadam/path/to/file.dart:lineNumber
  ///
  /// The error text is the actual text of the error.
  static printErrorInfo(dynamic e) {
    final info = _functionInfo();
    final tree = "${StackTrace.current}"
        .split('\n')
        .where((e) => e.contains(info.$1) && !e.contains(info.$2));
    if (tree.isNotEmpty) {
      var path = tree.first;
      path = path.substring(
        path.indexOf("package:bir_qadam"),
        path.length - 1,
      );
      debugPrint('==> Failure File Path: $path');
    }
    debugPrint('==> Failure Text: $e');
  }

  /// Returns information about the current function.
  ///
  /// The returned value is a tuple containing:
  ///
  /// 1. The package name of the current function.
  /// 2. The file path of the current function, relative to the package root.
  /// 3. The full file path of the current function.
  static (String, String, String) _functionInfo() {
    StackTrace v = StackTrace.current;
    var path = "$v".split('\n')[0].split(' ').last;
    path = path.substring(1, path.length - 1);

    return (
      path.substring(0, path.indexOf("/") + 1),
      path.substring(0, path.indexOf(".dart:") + 5),
      path,
    );
  }

  /// Formats the given [DateTime] according to the given [format].
  ///
  /// The [format] parameter is passed directly to [DateFormat.format].
  /// If [format] is not provided, the default format is "dd.MM.yyyy HH:mm".
  ///
  /// Example:
  ///
  ///     DateTime now = DateTime.now();
  ///     String formatted = localDateFormat(now); // "23.04.2022 14:30"
  static String localDateFormat(DateTime date,
      {String format = "dd.MM.yyyy HH:mm"}) {
    return DateFormat(format).format(date);
  }

  static String getPhone(text) {
    return text
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", "");
  }

  /// Formats a phone number given as a string of 9 digits into a
  /// nicely-formatted string like (12) 345-67-89. If the given
  /// string is not exactly 9 characters long, a FormatException is
  /// thrown.
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length != 9) {
      throw const FormatException(
          "Phone number should be exactly 9 digits long");
    }

    String areaCode = phoneNumber.substring(0, 2);
    String part1 = phoneNumber.substring(2, 5);
    String part2 = phoneNumber.substring(5, 7);
    String part3 = phoneNumber.substring(7, 9);

    return '($areaCode) $part1-$part2-$part3';
  }

  /// Opens a link in the default browser or app for the given url.
  ///
  /// If the link could not be opened, throws a string describing the error.
  static Future<void> openLink(String link) async {
    final Uri telegramUrl = Uri.parse(link);
    if (await canLaunchUrl(telegramUrl)) {
      await launchUrl(telegramUrl);
    } else {
      return;
      throw 'Could not launch $telegramUrl';
    }
  }

  /// Makes a phone call to the given phone number.
  ///
  /// The phone number should be given in international format with a leading
  /// plus sign (e.g. "+998901234567").
  ///
  /// The function returns a [Future] that resolves when the call is made. If the
  /// call is not supported on the device, the [Future] will throw an error.
  static Future<void> makePhoneCall(String phoneNumber) async {
    debugPrint("Phone $phoneNumber");
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  // static calculateDistance(double d, double e) {}

  String formatDate(String dateStr) {
    // Oylarning nomlari ro'yxati
    List<String> oylar = [
      "yanvar",
      "fevral",
      "mart",
      "aprel",
      "may",
      "iyun",
      "iyul",
      "avgust",
      "sentyabr",
      "oktyabr",
      "noyabr",
      "dekabr"
    ];

    // Stringni DateTime formatiga o'tkazish
    DateTime dateTime = DateTime.parse(dateStr);

    // Kunning raqami va oy nomini olish
    int kun = dateTime.day;
    String oy = oylar[dateTime.month - 1];

    // Formatlangan natijani qaytarish
    return "$kun-$oy";
  }

  static String formatDateMonth(DateTime date) {
    List<String> oylar = [
      "yanvar",
      "fevral",
      "mart",
      "aprel",
      "may",
      "iyun",
      "iyul",
      "avgust",
      "sentyabr",
      "oktyabr",
      "noyabr",
      "dekabr"
    ];

    int kun = date.day;
    String oy = oylar[date.month - 1];

    return "$kun-$oy";
  }

  static Future<void> makePrivacyPolicy() async {
    final Uri launchUri = Uri.parse('https://bir-qadam.uz/privacy');
    try {
      await launchUrl(launchUri);
    } catch (e) {
      Log.e(e);
    }
  }
}
