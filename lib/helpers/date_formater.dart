import 'package:intl/intl.dart';

String dateFormater(String dateString, {String format = 'dd MMMM yyyy'}) {
  if (dateString.isEmpty) {
    return "Tanggal tidak valid";
  }
  try {
    DateTime dateObject = DateTime.parse(dateString);
    return DateFormat(format, 'id_ID').format(dateObject);
  } catch (e) {
    // print('Error parsing date: $e');
    return "format salah";
  }
}
