part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignUpUserEvent extends SignupEvent{
  final String email;
  final String password;
  SignUpUserEvent(this.email, this.password);
}

class ShowErrorEvent extends SignupEvent{
  final String message;
  ShowErrorEvent(this.message);
}
