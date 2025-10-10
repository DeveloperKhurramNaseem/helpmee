part of 'latest_notifications_bloc.dart';

@immutable
sealed class LatestNotificationsState {}

class LatestNotificationsInitialState extends LatestNotificationsState {}

class LatestNotificationsLoadingState extends LatestNotificationsState {}

class LatestNotificationsLoadedState extends LatestNotificationsState {
  final List<NotificationData> notifications;
  LatestNotificationsLoadedState({required this.notifications});
}

class LatestNotificationsErrorState extends LatestNotificationsState {
  final String message;
  LatestNotificationsErrorState({required this.message});
}
