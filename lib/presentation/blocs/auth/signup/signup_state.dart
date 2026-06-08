part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupDoneState extends SignupState {
  final String message;

  SignupDoneState(this.message);
}

class SocialSignUpDoneState extends SignupState{
  final String message;
  final int activatedProducts;
  final String token;

  SocialSignUpDoneState({required this.message , required this.activatedProducts , required this.token});
}

class SignupErrorState extends SignupState {
  final String message;

  SignupErrorState(this.message);
}
