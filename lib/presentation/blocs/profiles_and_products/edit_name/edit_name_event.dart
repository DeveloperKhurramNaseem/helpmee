part of 'edit_name_bloc.dart';

@immutable
sealed class EditNameEvent {}

class EditProductNameEvent extends EditNameEvent{
  final String productName;
  final String productId;
  EditProductNameEvent({required this.productName, required this.productId});
}
