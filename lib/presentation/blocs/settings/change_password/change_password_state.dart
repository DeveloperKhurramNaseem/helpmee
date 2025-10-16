part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordDoneState extends ChangePasswordState {
  final String message;
  ChangePasswordDoneState(this.message);
}

class ChangePasswordErrorState extends ChangePasswordState {
  final String error;
  ChangePasswordErrorState(this.error);
}
