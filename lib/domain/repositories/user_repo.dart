import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/domain/entities/notification_data.dart';

abstract class UserRepo {
  Future<(bool,List<NotificationData>)> getLatestNotifications();
  Future<(bool,({List<NotificationModel> recentNotifications , List<NotificationModel> oldNotifications}))> getAllNotifications();
}