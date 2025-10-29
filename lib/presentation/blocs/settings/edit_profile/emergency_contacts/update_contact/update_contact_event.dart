part of 'update_contact_bloc.dart';

@immutable
sealed class UpdateContactEvent {}

class UpdateCurrentContactEvent extends UpdateContactEvent {
  final int contactId;
  final String name;
  final String phoneNumber;
  final String whatsappNumber;
  UpdateCurrentContactEvent({required this.contactId , required this.name , required this.phoneNumber , required this.whatsappNumber});
}
