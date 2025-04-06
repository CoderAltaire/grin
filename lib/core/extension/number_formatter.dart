import 'package:grin/generated/l10n.dart';
import 'package:intl/intl.dart';

extension NumberFormatExt on num {
  String get formatN => NumberFormat.currency(
        symbol: S.current.strSum,
        locale: 'uz',
        decimalDigits: 0,
      ).format(this);

  String get formatNWithoutS => NumberFormat.currency(
        symbol: '',
        locale: 'uz',
        decimalDigits: 0,
      ).format(this);
}
