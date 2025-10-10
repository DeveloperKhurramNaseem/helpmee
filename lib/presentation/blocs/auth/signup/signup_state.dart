part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupDoneState extends SignupState {
  final String message;

  SignupDoneState(this.message);
}

class SignupErrorState extends SignupState {
  final String message;

  SignupErrorState(this.message);
}
