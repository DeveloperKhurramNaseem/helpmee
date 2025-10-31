part of 'get_profile_data_bloc.dart';

@immutable
sealed class GetProfileDataEvent {}

class GetUserProfileDataEvent extends GetProfileDataEvent{
  final bool showLoading;

  GetUserProfileDataEvent({this.showLoading = true});
}
