part of 'delete_notification_user_bloc.dart';

@immutable
sealed class DeleteNotificationUserState {}

class DeleteNotificationUserInitialState extends DeleteNotificationUserState {}

class DeleteNotificationUserLoadingState extends DeleteNotificationUserState {
  final int id;
  DeleteNotificationUserLoadingState({required this.id});
}


class DeleteNotificationUserLoadedState extends DeleteNotificationUserState {}


class DeleteNotificationUserErrorState extends DeleteNotificationUserState {
  final String message;
  DeleteNotificationUserErrorState({required this.message});
}
