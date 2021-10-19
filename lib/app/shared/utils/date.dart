import 'package:intl/intl.dart';

class Date {
  static final _months = ['JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ'];

  static String parseDateWithoutTime(DateTime date) => DateFormat("dd/MM/yyyy").format(date.toLocal());

  static String getActualMonthName() {
    return _months[DateTime.now().month - 1];
  }

  static String getNextMonthName() {
    return _months[DateTime.now().month];
  }

  static String getPreviousMonthName() {
    return _months[DateTime.now().month - 2];
  }

  static String getMonthNameByIndex(int index) {
    return _months[index];
  }
}
