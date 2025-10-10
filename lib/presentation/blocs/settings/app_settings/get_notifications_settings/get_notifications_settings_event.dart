part of 'get_notifications_settings_bloc.dart';

@immutable
sealed class GetNotificationsSettingsEvent {}

class GetGeneralNotificationSettingsEvent
    extends GetNotificationsSettingsEvent {}

class UpdatePushNotificationValueEvent extends GetNotificationsSettingsEvent {
  final bool value;
  UpdatePushNotificationValueEvent({required this.value});
}

class UpdateInAppNotificationValueEvent extends GetNotificationsSettingsEvent {
  final bool value;
  UpdateInAppNotificationValueEvent({required this.value});
}

class UpdateEmailNotificationValueEvent extends GetNotificationsSettingsEvent {
  final bool value;
  UpdateEmailNotificationValueEvent({required this.value});
}


