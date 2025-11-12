part of 'get_products_bloc.dart';

@immutable
sealed class GetProductsEvent {}

class GetAllProductsEvent extends GetProductsEvent{
  final bool showLoading;

  GetAllProductsEvent({this.showLoading = true});
}
