part of 'switch_account_bloc.dart';

@immutable
sealed class  SwitchAccountEvent {}

class SwitchIntoNewAccountEvent extends SwitchAccountEvent{
  final int accountId;

  SwitchIntoNewAccountEvent(this.accountId);
}
