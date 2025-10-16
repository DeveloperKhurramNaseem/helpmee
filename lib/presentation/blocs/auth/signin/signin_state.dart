part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

class SigninInitialState extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninLoadedState extends SigninState {
  final String message;
  final int activatedProducts;
  final String token;
  SigninLoadedState({required this.message, required this.activatedProducts, required this.token});


}

class SigninErrorState extends SigninState {
  final String message;

  SigninErrorState(this.message);
}
