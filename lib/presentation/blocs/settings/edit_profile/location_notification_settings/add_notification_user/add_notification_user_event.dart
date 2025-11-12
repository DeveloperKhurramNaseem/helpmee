part of 'add_notification_user_bloc.dart';

@immutable
sealed class AddNotificationUserEvent {}

class AddNewNotificationUserEvent extends AddNotificationUserEvent {
  final String name;
  final String email;
  final int? id;
  AddNewNotificationUserEvent({required this.name, required this.email, this.id});
}
