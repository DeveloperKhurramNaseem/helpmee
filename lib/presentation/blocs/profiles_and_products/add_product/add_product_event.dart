part of 'add_product_bloc.dart';

@immutable
sealed class AddProductEvent {}

class AddNewProductEvent extends AddProductEvent {
   final String code;
  final String device;  

  AddNewProductEvent({
    required this.code,
    required this.device,    
  });
} 
