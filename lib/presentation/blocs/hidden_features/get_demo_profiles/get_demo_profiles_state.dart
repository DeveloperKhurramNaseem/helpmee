part of 'get_demo_profiles_bloc.dart';

@immutable
sealed class GetDemoProfilesState {}

class GetDemoProfilesInitialState extends GetDemoProfilesState {}

class GetDemoProfilesLoadingState extends GetDemoProfilesState {}


class GetDemoProfilesLoadedState extends GetDemoProfilesState {
  final List<DemoProfileModel> demoProfiles;

  GetDemoProfilesLoadedState({required this.demoProfiles});
}


class GetDemoProfilesErrorState extends GetDemoProfilesState {
  final String message;

  GetDemoProfilesErrorState({required this.message});
}
