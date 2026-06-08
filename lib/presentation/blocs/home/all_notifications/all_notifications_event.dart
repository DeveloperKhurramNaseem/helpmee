part of 'all_notifications_bloc.dart';

@immutable
sealed class AllNotificationsEvent {}


class GetAllNotificationsEvent extends AllNotificationsEvent {
  final bool isLoading;

  GetAllNotificationsEvent({this.isLoading = true});
}
