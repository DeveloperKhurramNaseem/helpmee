part of 'get_notification_user_bloc.dart';

@immutable
sealed class GetNotificationUserEvent {}

class GetAllNotificationUsersEvent extends GetNotificationUserEvent {}
