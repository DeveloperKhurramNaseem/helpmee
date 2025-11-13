part of 'transfer_data_bloc.dart';

@immutable
sealed class TransferDataState {}

class TransferDataInitialState extends TransferDataState {}

class TransferDataLoadingState extends TransferDataState {}


class TransferDataLoadedState extends TransferDataState {}


class TransferDataErrorState extends TransferDataState {
  final String message;
  TransferDataErrorState({required this.message});
}
