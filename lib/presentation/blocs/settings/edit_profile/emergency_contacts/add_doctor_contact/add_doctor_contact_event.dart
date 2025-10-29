part of 'add_doctor_contact_bloc.dart';

@immutable
sealed class AddDoctorContactEvent {}

class AddNewDoctorEvent extends AddDoctorContactEvent{
  final String name;
  final String phoneNumber;
  final String whatsappNumber;
  AddNewDoctorEvent({required this.name, required this.phoneNumber, required this.whatsappNumber});
}
