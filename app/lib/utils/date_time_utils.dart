import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:localisation/strings.dart';

String displayGreeting(BuildContext context) {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return Strings.of(context).goodMorning;
  }
  if (hour < 17) {
    return Strings.of(context).goodAfternoon;
  }
  return Strings.of(context).goodEvening;
}

String parseDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('d MMMM, EEEE');
  final String formatted = formatter.format(dateTime);
  return formatted;
}

String displayStrDigits(int n) => n.toString().padLeft(2, '0');

