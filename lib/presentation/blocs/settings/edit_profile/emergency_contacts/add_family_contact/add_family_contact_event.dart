part of 'add_family_contact_bloc.dart';

@immutable
sealed class AddFamilyContactEvent {}

class AddNewFamilyContactEvent extends AddFamilyContactEvent {
  final String name;
  final String phoneNumber;
  final String whatsappNumber;

  AddNewFamilyContactEvent({
    required this.name,
    required this.phoneNumber,
    required this.whatsappNumber,
  });
}
