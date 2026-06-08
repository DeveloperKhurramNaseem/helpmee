part of 'add_address_bloc.dart';

@immutable
sealed class AddAddressState {}

class AddAddressInitialState extends AddAddressState {}

class AddAddressLoadingState extends AddAddressState {}

class AddAddressLoadedState extends AddAddressState {}


class AddAddressErrorState extends AddAddressState {
  final String message;
  AddAddressErrorState({required this.message});
}
