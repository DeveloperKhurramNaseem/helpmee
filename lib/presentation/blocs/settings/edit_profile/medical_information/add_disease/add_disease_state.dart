part of 'add_disease_bloc.dart';

@immutable
sealed class AddDiseaseState {}

class AddDiseaseInitialState extends AddDiseaseState {}

class AddDiseaseLoadingState extends AddDiseaseState {}

class AddDiseaseDoneState extends AddDiseaseState {}

class AddDiseaseErrorState extends AddDiseaseState {
  final String message;
  AddDiseaseErrorState({required this.message});
}
