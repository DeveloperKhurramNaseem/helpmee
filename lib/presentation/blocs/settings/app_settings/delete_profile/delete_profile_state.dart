part of 'delete_profile_bloc.dart';

@immutable
sealed class DeleteProfileState {}

class DeleteProfileInitialState extends DeleteProfileState {}

class DeleteProfileLoadingState extends DeleteProfileState {}

class DeleteProfileDoneState extends DeleteProfileState {}

class DeleteProfileErrorState extends DeleteProfileState {
  final String message;

  DeleteProfileErrorState(this.message);
}
