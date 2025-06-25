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

String timeFormater(String dateString, {String format = 'HH:mm a'}) {
  if (dateString.isEmpty) {
    return 'Waktu tidak valid';
  }
  try {
    final String finalDate = '${dateString}Z';
    DateTime dataObject = DateTime.parse(finalDate);
    DateTime dateLocal = dataObject.toLocal();
    // print(finalDate);
    return DateFormat(format, 'id_ID').format(dateLocal);
  } catch (e) {
    return 'format salah';
  }
}
