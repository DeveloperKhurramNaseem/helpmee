part of 'add_notification_user_bloc.dart';

@immutable
sealed class AddNotificationUserState {}

class AddNotificationUserInitialState extends AddNotificationUserState {}

class AddNotificationUserLoadingState extends AddNotificationUserState {}

class AddNotificationUserLoadedState extends AddNotificationUserState {}

class AddNotificationUserErrorState extends AddNotificationUserState {
  final String message;
  AddNotificationUserErrorState({required this.message});
}
