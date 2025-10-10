part of 'activate_product_bloc.dart';

@immutable
sealed class ActivateProductState {}

class ActivateProductInitialState extends ActivateProductState {}

class ActivateProductLoadingState extends ActivateProductState {}

class ActivateProductDoneState extends ActivateProductState {}

class ActivateProductErrorState extends ActivateProductState {
  final String message;

  ActivateProductErrorState({required this.message});
}
