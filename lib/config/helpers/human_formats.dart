import 'package:intl/intl.dart';

class HumanFormats {
  static String formatNumber(double number, {parse = false}) {
    number =
        parse ? double.parse(number.toString().replaceAll('.', '')) : number;
    final value =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: 'en')
            .format(number);
    return value;
  }
}
