part of 'set_pin_bloc.dart';

@immutable
sealed class SetPinEvent {}

class SetNewPinEvent extends SetPinEvent{
  final PinData pinData;
  final bool setPin;
  SetNewPinEvent({required this.pinData , required this.setPin});
}
