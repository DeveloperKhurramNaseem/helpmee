part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordState {}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordLoadedState extends ForgetPasswordState {
  final String message;
  ForgetPasswordLoadedState({required this.message});
}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String message;
  ForgetPasswordErrorState({required this.message});
}
