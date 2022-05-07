import 'package:date_time_format/date_time_format.dart';

String getCurrentDateTimeNow() {
  final dateTime = DateTime.now();

  return dateTime.format();  // 2019-10-15T19:42:05-08:00
}