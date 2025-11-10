part of 'restore_product_bloc.dart';

@immutable
sealed class RestoreProductState {}

class RestoreProductInitialState extends RestoreProductState {}

class RestoreProductLoadingState extends RestoreProductState {}


class RestoreProductDoneState extends RestoreProductState {
  final String message;

  RestoreProductDoneState(this.message);
}


class RestoreProductErrorState extends RestoreProductState {
  final String message;

  RestoreProductErrorState(this.message);
}
