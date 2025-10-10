part of 'set_pin_bloc.dart';

@immutable
sealed class SetPinState {}

class SetPinInitialState extends SetPinState {}

class SetPinLoadingState extends SetPinState {}

class SetPinDoneState extends SetPinState {
  final String message;

  SetPinDoneState(this.message);
}

class SetPinErrorState extends SetPinState {
    final String message;

  SetPinErrorState(this.message);
}
