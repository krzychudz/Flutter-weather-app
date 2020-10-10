import 'package:intl/intl.dart';

extension TimeParsing on int {
  String convertToDateAsString(DateFormat dateFormat) {
    return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }
}

extension TemperatureParsing on double {
  String formatTemperature() {
    return "${this.toStringAsFixed(1)}\u00B0C";
  }
}
