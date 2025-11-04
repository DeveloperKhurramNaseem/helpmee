part of 'get_location_notification_settings_bloc.dart';

@immutable
sealed class GetLocationNotificationSettingsState {
  final LocationNotificationModel locationNotificationModel;

  const GetLocationNotificationSettingsState({required this.locationNotificationModel});
}

class GetLocationNotificationSettingsInitialState
    extends GetLocationNotificationSettingsState {
      const GetLocationNotificationSettingsInitialState({required super.locationNotificationModel});
    }

    class GetLocationNotificationSettingsLoadingState
    extends GetLocationNotificationSettingsState {
      const GetLocationNotificationSettingsLoadingState({required super.locationNotificationModel});
    }


    class GetLocationNotificationSettingsLoadedState
    extends GetLocationNotificationSettingsState { 

      const GetLocationNotificationSettingsLoadedState({required super.locationNotificationModel});
    }

    class GetLocationNotificationSettingsErrorState
    extends GetLocationNotificationSettingsState {
      final String message;

      const GetLocationNotificationSettingsErrorState({required super.locationNotificationModel, required this.message});
    }
