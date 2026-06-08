part of 'switch_account_bloc.dart';

@immutable
sealed class SwitchAccountState {}

class SwitchAccountInitialState extends SwitchAccountState {}

class SwitchAccountLoadingState extends SwitchAccountState {}

class SwitchAccountLoadedState extends SwitchAccountState {}


class SwitchAccountErrorState extends SwitchAccountState {
  final String message;
  SwitchAccountErrorState({required this.message});
}

