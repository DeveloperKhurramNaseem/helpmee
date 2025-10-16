part of 'create_password_bloc.dart';

@immutable
sealed class CreatePasswordState {}

class CreatePasswordInitialState extends CreatePasswordState {}

class CreatePasswordLoadingState extends CreatePasswordState {}

class CreatePasswordDoneState extends CreatePasswordState {
  final String message;

  CreatePasswordDoneState(this.message);
}

class CreatePasswordErrorState extends CreatePasswordState {
  final String message;

  CreatePasswordErrorState(this.message);
}
