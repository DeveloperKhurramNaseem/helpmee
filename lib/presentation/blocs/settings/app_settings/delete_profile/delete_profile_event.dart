part of 'delete_profile_bloc.dart';

@immutable
sealed class DeleteProfileEvent {}

class DeleteProfileAccountEvent extends DeleteProfileEvent{}
