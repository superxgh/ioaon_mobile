import 'package:date_time_format/date_time_format.dart';

String getCurrentDateTxtTimeNow() {
  final dateTime = DateTime.now();
  return dateTime.format();  // 2019-10-15T19:42:05-08:00
}

DateTime getCurrentDateTimeNow() {
  return  DateTime.now();
}

DateTime strToDateTime(String str) {
  return DateTime.parse(str);
}

String getDateTxtYYYYMMDD(DateTime dt) {
  return dt.format('Y-m-d');  // 2019-10-15T19:42:05-08:00
}

String getDateTxtHHMM(DateTime dt) {
  return dt.format('H:s');  // 2019-10-15T19:42:05-08:00
}