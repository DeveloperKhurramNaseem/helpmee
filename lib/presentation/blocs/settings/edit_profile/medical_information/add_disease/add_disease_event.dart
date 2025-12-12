part of 'add_disease_bloc.dart';

@immutable
sealed class AddDiseaseEvent {}

class AddNewDiseaseEvent extends AddDiseaseEvent{
  final String diseaseName;
  final String medications;
  final String details;
  final bool isCheck;
  final ProfileType profileType;
  AddNewDiseaseEvent({required this.diseaseName , required this.medications , required this.details , required this.isCheck , required this.profileType});}

