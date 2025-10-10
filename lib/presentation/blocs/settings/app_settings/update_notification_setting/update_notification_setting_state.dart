part of 'update_notification_setting_bloc.dart';

@immutable
sealed class UpdateNotificationSettingState {}

class UpdateNotificationSettingInitialState
    extends UpdateNotificationSettingState {}

    class UpdateNotificationSettingLoadingState
    extends UpdateNotificationSettingState {}


    class UpdateNotificationSettingDoneState
    extends UpdateNotificationSettingState {}

    class UpdateNotificationSettingErrorState
    extends UpdateNotificationSettingState {}
