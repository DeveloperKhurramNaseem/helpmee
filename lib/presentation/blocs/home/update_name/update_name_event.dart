part of 'update_name_bloc.dart';

@immutable
sealed class UpdateNameEvent {}

class UpdateNameInitEvent extends UpdateNameEvent {
  final String firstName;
  final String lastName;

  UpdateNameInitEvent({required this.firstName, required this.lastName});
}
