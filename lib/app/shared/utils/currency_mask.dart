import 'package:intl/intl.dart';

class CurrencyInputFormatter {
  static String formatValue(String value) {
    var newValue = double.parse(value);

    return NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
        .format(newValue);
  }
}
