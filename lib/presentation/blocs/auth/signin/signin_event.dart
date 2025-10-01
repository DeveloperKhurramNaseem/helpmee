part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

class SignInUserEvent extends SigninEvent {
  final String email;
  final String password;
  SignInUserEvent({required this.email, required this.password});
}

class ShowErrorEvent extends SigninEvent{
  final String message;
  ShowErrorEvent({required this.message});
}
