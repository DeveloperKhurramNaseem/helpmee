part of 'set_pin_bloc.dart';

@immutable
sealed class SetPinEvent {}

class SetNewPinEvent extends SetPinEvent{
  final PinData pinData;
  SetNewPinEvent({required this.pinData});
}
