extension DateTimeExt on DateTime {
  DateTime get roundMin =>
      DateTime(year, month, day, hour, () {
        if (minute <= 30) {
          return 30;
        } else {
          return 60;
        }
      }());
}
