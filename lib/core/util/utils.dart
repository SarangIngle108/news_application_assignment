import 'package:intl/intl.dart';

String formattedDate(String date) {
  return DateFormat("dd MMM',' yy")
      .format(DateFormat('yyyy-MM-dd').parse(date));
}
