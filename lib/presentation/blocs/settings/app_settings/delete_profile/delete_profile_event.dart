part of 'delete_profile_bloc.dart';

@immutable
sealed class DeleteProfileEvent {}

class DeleteProfileAccountEvent extends DeleteProfileEvent{
  final bool makeChildParent;
  final int? accountId;
  DeleteProfileAccountEvent({required this.makeChildParent , this.accountId});
}
