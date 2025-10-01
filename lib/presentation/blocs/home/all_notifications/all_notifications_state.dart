part of 'all_notifications_bloc.dart';

@immutable
sealed class AllNotificationsState {}

class AllNotificationsInitialState extends AllNotificationsState {}

class AllNotificationsLoadingState extends AllNotificationsState {}

class AllNotificationsLoadedState extends AllNotificationsState {
  final List<NotificationData> recentNotifications;
  final List<NotificationData> oldNotificationsList;
  AllNotificationsLoadedState({required this.recentNotifications, required this.oldNotificationsList});
}

class AllNotificationsErrorState extends AllNotificationsState {
  final String message;
  AllNotificationsErrorState({required this.message});
}
