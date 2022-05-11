import 'package:ioaon_mobile/utils/tools/date_time.dart';
import 'package:logger/logger.dart';

final logger = (Type type) => Logger(
  printer:CustomerPrinter(type.toString()),
  level: Level.verbose,
);

class CustomerPrinter extends LogPrinter {
  final String className;

  CustomerPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    return [color!('${getCurrentDateTxtTimeNow()} $emoji $className: $message')];
  }
}