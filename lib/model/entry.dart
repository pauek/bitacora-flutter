import 'package:hive/hive.dart';

part 'entry.g.dart';

@HiveType()
class Entry {
  // We use the negative time as key in Hive to sort in descending order.
  String get id => (-time.millisecondsSinceEpoch).toString();

  @HiveField(0)
  String text;

  @HiveField(1)
  DateTime time;

  static Entry fromText(String text) {
    return Entry()
      ..text = text
      ..time = DateTime.now();
  }
}
