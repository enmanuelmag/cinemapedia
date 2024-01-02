import 'package:intl/intl.dart';

class HumanFormats {
  static String formatNumber(double number, {parse = false, int decimals = 0}) {
    number =
        parse ? double.parse(number.toString().replaceAll('.', '')) : number;
    final value = NumberFormat.compactCurrency(
            decimalDigits: decimals, symbol: '', locale: 'en')
        .format(number);
    return value;
  }
}
