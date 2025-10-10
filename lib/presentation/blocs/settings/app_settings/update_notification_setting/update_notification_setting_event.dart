part of 'update_notification_setting_bloc.dart';

@immutable
sealed class UpdateNotificationSettingEvent {}

class UpdateGeneralNotificationSettingEvent extends UpdateNotificationSettingEvent{
  final NotificationSetting notificationSetting;

  UpdateGeneralNotificationSettingEvent(this.notificationSetting);
}
