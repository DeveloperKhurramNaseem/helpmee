import 'package:intl/intl.dart';

class DateFormatting {
  static String formatDateForNotification(DateTime dateTime) {
    var todayDate = DateTime.now();
    if (dateTime.day == todayDate.day &&
        dateTime.month == todayDate.month &&
        dateTime.year == todayDate.year) {
      var duration = todayDate.difference(dateTime);
      if (duration.inHours == 0 && duration.inMinutes == 0) {
        return 'Now';
      }
      return duration.inHours >= 1
          ? '${duration.inHours} hours ago'
          : '${duration.inMinutes} ${duration.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    }
    if (todayDate.difference(dateTime).inDays == 1) {
      return 'Yesterday\n${DateFormat('hh:mm a').format(dateTime)}';
    }
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
