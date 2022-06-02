import 'package:intl/intl.dart';

extension MessageTime on DateTime {
  String toHHMM() {
    if (isSameDay()) {
      return DateFormat.Hm().format(this);
    } else {
      return DateFormat("dd/MM/yyyy").format(this);
    }
  }

  bool isSameDay() {
    var now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
}
