part of 'get_user_profile_bloc.dart';

@immutable
sealed class GetUserProfileState {}

class GetUserProfileInitial extends GetUserProfileState {}

class GetUserProfileLoading extends GetUserProfileState {}

class GetUserProfileLoaded extends GetUserProfileState {}

class GetUserProfileError extends GetUserProfileState {
  final String error;

  GetUserProfileError(this.error);
}
