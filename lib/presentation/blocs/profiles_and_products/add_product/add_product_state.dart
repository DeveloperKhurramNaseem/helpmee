part of 'add_product_bloc.dart';

@immutable
sealed class AddProductState {}

class AddProductInitialState extends AddProductState {}

class AddProductLoadingState extends AddProductState {}

class AddProductDoneState extends AddProductState {
  final String device;

  AddProductDoneState({required this.device});
}

class AddProductErrorState extends AddProductState {
  final String message;

  AddProductErrorState({required this.message});
}
