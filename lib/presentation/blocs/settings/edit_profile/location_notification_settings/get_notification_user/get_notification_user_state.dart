part of 'get_notification_user_bloc.dart';

@immutable
sealed class GetNotificationUserState {}

class GetNotificationUserInitialState extends GetNotificationUserState {}

class GetNotificationUserLoadingState extends GetNotificationUserState {}


class GetNotificationUserDoneState extends GetNotificationUserState {
  final List<NotificationUserModel> notificationUserList;

  GetNotificationUserDoneState({required this.notificationUserList});
}


class GetNotificationUserErrorState extends GetNotificationUserState {
  final String message;

  GetNotificationUserErrorState({required this.message});
}
