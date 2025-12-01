part of 'update_name_bloc.dart';

@immutable
sealed class UpdateNameEvent {}

class UpdateNameInitEvent extends UpdateNameEvent {
  final String firstName;
  final String lastName;
  final String? token;
  final int? accountId;

  UpdateNameInitEvent({required this.firstName, required this.lastName , required this.token, required this.accountId,});
}
