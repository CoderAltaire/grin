import 'package:intl/intl.dart';

class AppFormatter {
  const AppFormatter._();
  static String formatDate(DateTime date) {
    int year = date.year;
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String formatted = '$day.$month.$year';

    return formatted;
  }

  static String formatTimeFromMills(num? mills, {bool hasSecond = false}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(mills?.toInt() ?? 0);
    String hour = date.hour.toString().padLeft(2, '0');
    String minute = date.minute.toString().padLeft(2, '0');
    String second = date.second.toString().padLeft(2, '0');

    String formatted = '$hour:$minute';
    String withSecond = '$hour:$minute:$second';
    return hasSecond ? withSecond : formatted;
  }
  static String formatTime(String time) {
  try {
    final parsedTime = DateFormat('HH:mm').parse(time);
    return DateFormat('HH:mm').format(parsedTime);
  } catch (e) {
    return time; // Return the original if parsing fails
  }
}
}
