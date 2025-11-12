part of 'get_products_bloc.dart';

@immutable
sealed class GetProductsState {}

class GetProductsInitialState extends GetProductsState {}

class GetProductsLoadingState extends GetProductsState {}

class GetProductsLoadedState extends GetProductsState {
  final List<ProductModel> products;
  GetProductsLoadedState({required this.products});
}

class GetProductsErrorState extends GetProductsState {
  final String message;
  GetProductsErrorState({required this.message});
}
