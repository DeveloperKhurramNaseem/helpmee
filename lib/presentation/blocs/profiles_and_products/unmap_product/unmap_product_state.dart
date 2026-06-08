part of 'unmap_product_bloc.dart';

@immutable
sealed class UnmapProductState {}

class UnmapProductInitialState extends UnmapProductState {}

class UnmapProductLoadingState extends UnmapProductState {}

class UnmapProductDoneState extends UnmapProductState {
  final String message;
  UnmapProductDoneState({required this.message});
}


class UnmapProductErrorState extends UnmapProductState {
  final String message;
  UnmapProductErrorState({required this.message});
}
