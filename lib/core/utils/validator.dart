// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:grin/generated/l10n.dart';

/*========================Email Validator==============================================*/
class Validator {
  static String? fieldChecker({required String value, required message}) {
    if (value.toString().trim().isEmpty) {
      return "$message ${S.current.strCannotBeEmpty}";
    }
    return null;
  }

  static String? fieldCheckerLimitedSum(
      {required String value, required message}) {
    num cleanedCash = 0;
    cleanedCash = num.tryParse(
            value.replaceAll('UZS', '').replaceAll(RegExp(r'\s+'), '')) ??
        0;
    if (value.toString().trim().isEmpty || cleanedCash < 500) {
      return "$message ${S.current.strCannotBeEmpty}";
    }
    return null;
  }

  static String? phoneChecker({required String value, required message}) {
    if (value.toString().trim().isEmpty) {
      return "$message ${S.current.strCannotBeEmpty}";
    } else if (value.length != 14) {
      return S.current.strTheNumberWasEnteredIncorrectly;
    }
    return null;
  }

  static String? phoneCheckerWithSwitch({
    required String value,
    required message,
    required bool swtichValue,
  }) {
    if (swtichValue) {
      if (value.toString().trim().isEmpty) {
        return "$message ${S.current.strCannotBeEmpty}";
      } else if (value.length != 14) {
        return S.current.strTheNumberWasEnteredIncorrectly;
      }
    }
    return null;
  }
}
