import 'package:intl/intl.dart';

String convertTimestampToDate(int timestamp) {
  return DateFormat('MMM dd, yyyy')
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toUtc());
}
