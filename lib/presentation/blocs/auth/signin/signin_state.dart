part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

class SigninInitialState extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninLoadedState extends SigninState {
  final String message;

  SigninLoadedState(this.message);


}

class SigninErrorState extends SigninState {
  final String message;

  SigninErrorState(this.message);
}
