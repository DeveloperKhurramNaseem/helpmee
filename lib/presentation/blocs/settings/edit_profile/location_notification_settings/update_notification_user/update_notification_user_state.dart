part of 'update_notification_user_bloc.dart';

@immutable
sealed class UpdateNotificationUserState {}

class UpdateNotificationUserInitialState extends UpdateNotificationUserState {}

class UpdateNotificationUserLoadingState extends UpdateNotificationUserState {}


class UpdateNotificationUserLoadedState extends UpdateNotificationUserState {}


class UpdateNotificationUserErrorState extends UpdateNotificationUserState {
  final String message;
  UpdateNotificationUserErrorState({required this.message});
}
