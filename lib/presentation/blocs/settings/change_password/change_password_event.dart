part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordEvent {}

class ChangeCurrentPasswordEvent extends ChangePasswordEvent{
  final String currentPassword;
  final String newPassword;
  ChangeCurrentPasswordEvent({required this.currentPassword , required this.newPassword});
}


class ShowErrorEvent extends ChangePasswordEvent{
  final String message;
  ShowErrorEvent({required this.message});
}