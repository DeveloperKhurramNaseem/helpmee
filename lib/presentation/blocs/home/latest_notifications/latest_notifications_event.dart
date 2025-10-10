part of 'latest_notifications_bloc.dart';

@immutable
sealed class LatestNotificationsEvent {}

class GetLatestNotificationsEvent extends LatestNotificationsEvent {  
}
