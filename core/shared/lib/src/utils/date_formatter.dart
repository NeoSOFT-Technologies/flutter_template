import 'package:intl/intl.dart';

class DateFormatter {
  static final yyyyMMddHHmmss = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  static final ddMMMM = DateFormat("dd MMMM");
  static final eeee = DateFormat("EEEE");
  static final eeeeddMMMM = DateFormat("EEEE dd,MMMM");

  static String format(DateTime dateTime, DateFormat dateFormat) {
    return dateFormat.format(dateTime);
  }
}
