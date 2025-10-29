part of 'get_location_notification_settings_bloc.dart';

@immutable
sealed class GetLocationNotificationSettingsState {}

class GetLocationNotificationSettingsInitialState
    extends GetLocationNotificationSettingsState {}

    class GetLocationNotificationSettingsLoadingState
    extends GetLocationNotificationSettingsState {}


    class GetLocationNotificationSettingsLoadedState
    extends GetLocationNotificationSettingsState {
      final LocationNotificationModel locationNotificationModel;

      GetLocationNotificationSettingsLoadedState(this.locationNotificationModel);
    }

    class GetLocationNotificationSettingsErrorState
    extends GetLocationNotificationSettingsState {
      final String message;

      GetLocationNotificationSettingsErrorState({required this.message});
    }
