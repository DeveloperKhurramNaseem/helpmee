part of 'delete_address_bloc.dart';

@immutable
sealed class DeleteAddressEvent {}

class DeleteCurrentAddressEvent extends DeleteAddressEvent{
  final int addressId;

  DeleteCurrentAddressEvent({required this.addressId});
}
