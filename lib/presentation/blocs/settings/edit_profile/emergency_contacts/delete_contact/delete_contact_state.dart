part of 'delete_contact_bloc.dart';

@immutable
sealed class DeleteContactState {}

class DeleteContactInitialState extends DeleteContactState {}

class DeleteContactLoadingState extends DeleteContactState {}


class DeleteContactLoadedState extends DeleteContactState {}

class DeleteContactErrorState extends DeleteContactState {
  final String message;
  DeleteContactErrorState({required this.message});
}
