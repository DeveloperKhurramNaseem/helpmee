part of 'update_contact_bloc.dart';

@immutable
sealed class UpdateContactState {}

class UpdateContactInitialState extends UpdateContactState {}

class UpdateContactLoadingState extends UpdateContactState {}

class UpdateContactLoadedState extends UpdateContactState {}

class UpdateContactErrorState extends UpdateContactState {
  final String message;

  UpdateContactErrorState({required this.message});
}

