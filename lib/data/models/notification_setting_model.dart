import 'package:help_mee/domain/entities/notification_setting.dart';

class NotificationSettingModel extends NotificationSetting{
  static const inPushNotificationKey = 'push_notification' , inEmailNotificationKey = 'email_newsletter' , inAppNotificationKey = 'inapp_notification';

  NotificationSettingModel({required super.isPushNotificationAllowed, required super.isEmailNotificationAllowed, required super.inAppNotificationAllowed});

  factory NotificationSettingModel.fromMap(Map<String,dynamic> map){
    return NotificationSettingModel(
      isPushNotificationAllowed: map[inPushNotificationKey],
      isEmailNotificationAllowed: map[inEmailNotificationKey],
      inAppNotificationAllowed: map[inAppNotificationKey],
    );
  }

  factory NotificationSettingModel.fromNotificationSetting(NotificationSetting setting){
    return NotificationSettingModel(
      isPushNotificationAllowed: setting.isPushNotificationAllowed,
      isEmailNotificationAllowed: setting.isEmailNotificationAllowed,
      inAppNotificationAllowed: setting.inAppNotificationAllowed,
    );
  }

  factory NotificationSettingModel.empty(){
    return NotificationSettingModel(
      isPushNotificationAllowed: false,
      isEmailNotificationAllowed: false,
      inAppNotificationAllowed: false,
    );
  }

  Map<String,dynamic> toMap(){
    return {
      inPushNotificationKey: isPushNotificationAllowed,
      inEmailNotificationKey: isEmailNotificationAllowed,
      inAppNotificationKey: inAppNotificationAllowed,
    };
  }

} 