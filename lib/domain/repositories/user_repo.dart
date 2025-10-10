import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/entities/notification_setting.dart';
import 'package:help_mee/domain/entities/pin_data.dart';

abstract class UserRepo {
  Future<(bool,List<NotificationData>)> getLatestNotifications();
  Future<(bool,({List<NotificationModel> recentNotifications , List<NotificationModel> oldNotifications}))> getAllNotifications();
  Future<(bool,String)> activateProduct(String code , String device);
  Future<(bool,NotificationSetting)> getNotificationSetting();
  Future<(bool,String)> updateNotificationSetting(NotificationSetting setting);
  Future<(bool,String)> setNewPin(PinData pinData);
}