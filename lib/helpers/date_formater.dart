import 'package:intl/intl.dart';

String dateFormater(String dateString, {String format = 'dd MMMM yyyy'}) {
  if (dateString.isEmpty) {
    return "Tanggal tidak valid";
  }
  try {
    DateTime dateObject = DateTime.parse(dateString);
    return DateFormat(format, 'id_ID').format(dateObject);
  } catch (e) {
    return "format salah";
  }
}

String timeFormater(String dateString, {String format = 'HH:mm a'}) {
  if (dateString.isEmpty) {
    return 'Waktu tidak valid';
  }
  try {
    DateTime dataObject = DateTime.parse(dateString);
    DateTime dateLocal = dataObject.toLocal();
    return DateFormat(format, 'id_ID').format(dateLocal);
  } catch (e) {
    return 'format salah';
  }
}
