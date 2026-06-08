part of 'update_notification_user_bloc.dart';

@immutable
sealed class UpdateNotificationUserEvent {}

class UpdateCurrentNotificationUserEvent extends UpdateNotificationUserEvent {
  final int notificationUserId;
  final String name;
  final String email;
  UpdateCurrentNotificationUserEvent({required this.notificationUserId, required this.name, required this.email,});
}
