part of 'delete_notification_user_bloc.dart';

@immutable
sealed class DeleteNotificationUserEvent {}

class DeleteCurrentNotificationUserEvent extends DeleteNotificationUserEvent{
  final int notificationUserId;  

  DeleteCurrentNotificationUserEvent(this.notificationUserId);
}
