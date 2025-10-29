part of 'delete_address_bloc.dart';

@immutable
sealed class DeleteAddressState {}

class DeleteAddressInitialState extends DeleteAddressState {}

class DeleteAddressLoadingState extends DeleteAddressState {}

class DeleteAddressLoadedState extends DeleteAddressState {}

class DeleteAddressErrorState extends DeleteAddressState {
  final String message;
  DeleteAddressErrorState({required this.message});
}
