part of 'update_name_bloc.dart';

@immutable
sealed class UpdateNameState {}

class UpdateNameInitialState extends UpdateNameState {}

class UpdateNameLoadingState extends UpdateNameState {}

class UpdateNameDoneState extends UpdateNameState {}

class UpdateNameErrorState extends UpdateNameState {
  final String message;
  UpdateNameErrorState({required this.message});
}
