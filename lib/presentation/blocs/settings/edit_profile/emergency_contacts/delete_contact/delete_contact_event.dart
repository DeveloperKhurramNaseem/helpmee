part of 'delete_contact_bloc.dart';

@immutable
sealed class DeleteContactEvent {}

class DeleteCurrentContact extends DeleteContactEvent{
    final int contactId;
    DeleteCurrentContact({required this.contactId});
}
