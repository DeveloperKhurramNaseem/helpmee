part of 'activate_product_bloc.dart';

@immutable
sealed class ActivateProductEvent {}

class ActivateNewProductEvent extends ActivateProductEvent {
  final String code;
  final String device;

  ActivateNewProductEvent({required this.code, required this.device});
}  
