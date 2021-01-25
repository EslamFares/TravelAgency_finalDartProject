import 'package:intl/intl.dart';

DateTime dateConverter(String date) {
  final format = DateFormat("dd-MM-yyyy");
  DateTime gettingDate = format.parse(date);
  final DateFormat newFormatter = DateFormat('yyyy-MM-dd');
  final String formatted = newFormatter.format(gettingDate);
  return DateTime.parse(formatted);
}