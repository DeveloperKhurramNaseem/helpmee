part of 'update_location_notification_settings_bloc.dart';

@immutable
sealed class UpdateLocationAndNotificationSettingsEvent {}

class UpdateCurrentLocationNotificationSettingsEvent
    extends UpdateLocationAndNotificationSettingsEvent {
  final bool pushNotification;
  final bool emailNotification;
  final bool inAppNotification;
  final bool emailHelpMeeNotification;

  UpdateCurrentLocationNotificationSettingsEvent({
    required this.pushNotification,
    required this.emailNotification,
    required this.inAppNotification,
    required this.emailHelpMeeNotification,
  });
}
