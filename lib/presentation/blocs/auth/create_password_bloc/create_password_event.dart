part of 'create_password_bloc.dart';

@immutable
sealed class CreatePasswordEvent {}

class CreateNewPasswordEvent extends CreatePasswordEvent{
  final String email;
  final String password;
  CreateNewPasswordEvent({required this.email,required this.password});
}

class ShowErrorEvent extends CreatePasswordEvent{
  final String message;
  ShowErrorEvent(this.message);
}

class ResetErrorEvent extends CreatePasswordEvent{
  
  ResetErrorEvent();
}

