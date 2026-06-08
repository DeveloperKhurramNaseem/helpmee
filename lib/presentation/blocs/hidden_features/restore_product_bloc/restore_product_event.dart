part of 'restore_product_bloc.dart';

@immutable
sealed class RestoreProductEvent {}

class RestoreThisProductEvent extends RestoreProductEvent{
  final String code;
  RestoreThisProductEvent({required this.code});
}
