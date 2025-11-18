import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/util/dependencies/init.dart';
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
          ? '${duration.inHours} ${duration.inHours == 1 ? 'hour' : 'hours'} ago'
          : '${duration.inMinutes} ${duration.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    }
    if (todayDate.difference(dateTime).inDays == 1) {
      return 'Yesterday\n${DateFormat('hh:mm a').format(dateTime)}';
    }
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String formatDateForTextField(DateTime dateTime) {
    var lang = sl<StorageService>().getLanguage();
    return lang == 'en'
        ? DateFormat('MMMM dd, yyyy').format(dateTime)
        : DateFormat('dd.MM.yyyy', 'de_DE').format(dateTime);
  }

  static String formatTimeForTextField(DateTime dateTime) {
    var lang = sl<StorageService>().getLanguage();
    return lang == 'en'
        ? DateFormat('hh:mm a').format(dateTime)
        : DateFormat('HH:mm', 'de_DE').format(dateTime);
  }
}
