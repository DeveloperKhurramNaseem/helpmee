part of 'unmap_product_bloc.dart';

@immutable
sealed class UnmapProductEvent {}

class UnmapCurrentProduct extends UnmapProductEvent {
  final String productId;
  UnmapCurrentProduct({required this.productId});
}
