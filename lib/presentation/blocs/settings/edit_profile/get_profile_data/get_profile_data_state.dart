part of 'get_profile_data_bloc.dart';

@immutable
sealed class GetProfileDataState {}

class GetProfileDataInitialState extends GetProfileDataState {}

class GetProfileDataLoadingState extends GetProfileDataState {}

class GetProfileDataLoadedState extends GetProfileDataState {
  final UserProfileModel userProfile;
  GetProfileDataLoadedState(this.userProfile);
}

class GetProfileDataErrorState extends GetProfileDataState {
  final String message;
  GetProfileDataErrorState(this.message);
}
