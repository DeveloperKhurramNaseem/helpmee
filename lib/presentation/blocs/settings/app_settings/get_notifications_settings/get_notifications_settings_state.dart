part of 'get_notifications_settings_bloc.dart';

@immutable
sealed class GetNotificationsSettingsState {}

class GetNotificationsSettingsInitialState
    extends GetNotificationsSettingsState {}

class GetNotificationsSettingsUpdateState
    extends GetNotificationsSettingsState {
  GetNotificationsSettingsUpdateState();
}
