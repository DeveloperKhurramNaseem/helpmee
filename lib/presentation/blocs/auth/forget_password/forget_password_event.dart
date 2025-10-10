part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

class ForgetPasswordInitEvent extends ForgetPasswordEvent{
  final String email;

  ForgetPasswordInitEvent(this.email);
}
