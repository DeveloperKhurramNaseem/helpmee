
import 'package:help_mee/data/models/location_notification_model.dart';
import 'package:help_mee/data/models/notification_user_model.dart';
import 'package:help_mee/data/models/requests/notification_user_info.dart';

abstract class UserLocationNotificationRepo {
  Future<(bool, String, LocationNotificationModel)>
  getUserLocationNotificationSettings();
  Future<(bool, String, LocationNotificationModel)>
  updateLocationNotificationSettings(
    LocationNotificationModel locationNotificationModel,
  );
  Future<(bool,String)> addNotificationUser(NotificationUserInfo userInfo);
   Future<(bool,String)> updateNotificationUser(int notificationUserId , NotificationUserInfo userInfo);
   Future<(bool,String)> deleteNotificationUser(int notificationUserId);
   Future<(bool,String,List<NotificationUserModel>)> getNotificationUsers();  
}
