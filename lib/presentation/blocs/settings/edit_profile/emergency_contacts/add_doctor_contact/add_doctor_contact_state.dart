part of 'add_doctor_contact_bloc.dart';

@immutable
sealed class AddDoctorContactState {}

class AddDoctorContactInitialState extends AddDoctorContactState {}

class AddDoctorContactLoadingState extends AddDoctorContactState {}

class AddDoctorContactLoadedState extends AddDoctorContactState {}

class AddDoctorContactErrorState extends AddDoctorContactState {
  final String message;
  AddDoctorContactErrorState({required this.message});
}
