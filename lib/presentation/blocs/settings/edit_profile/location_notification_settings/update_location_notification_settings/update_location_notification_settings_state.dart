part of 'update_location_notification_settings_bloc.dart';

@immutable
sealed class UpdateLocationAndNotificationSettingsState {}

class UpdateLocationAndNotificationSettingsInitialState
    extends UpdateLocationAndNotificationSettingsState {}

    class UpdateLocationAndNotificationSettingsLoadingState
    extends UpdateLocationAndNotificationSettingsState {}


    class UpdateLocationAndNotificationSettingsLoadedState
    extends UpdateLocationAndNotificationSettingsState {}


    class UpdateLocationAndNotificationSettingsErrorState
    extends UpdateLocationAndNotificationSettingsState {
      final String message;

      UpdateLocationAndNotificationSettingsErrorState({required this.message});
    }
