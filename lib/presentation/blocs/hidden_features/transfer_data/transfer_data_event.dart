part of 'transfer_data_bloc.dart';

@immutable
class TransferDataEvent {
  final String userName;

  const TransferDataEvent({
    required this.userName,
  });
}
