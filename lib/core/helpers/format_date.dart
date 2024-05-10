import 'package:intl/intl.dart';

String formatDate(String date) {
  final inputFormat = DateFormat('yyyy-MM-dd');
  final inputDate = inputFormat.parse(date);

  final outputFormat = DateFormat('MMMM dd, yyyy');
  final outputDate = outputFormat.format(inputDate);

  return outputDate;
}
