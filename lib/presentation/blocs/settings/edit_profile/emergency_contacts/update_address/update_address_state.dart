part of 'update_address_bloc.dart';

@immutable
sealed class UpdateAddressState {}

class UpdateAddressInitialState extends UpdateAddressState {}

class UpdateAddressLoadingState extends UpdateAddressState {}

class UpdateAddressLoadedState extends UpdateAddressState {}

class UpdateAddressErrorState extends UpdateAddressState {
  final String message;
  UpdateAddressErrorState({required this.message});
}

