part of 'delete_disease_bloc.dart';

@immutable
sealed class DeleteDiseaseState {}

class DeleteDiseaseInitialState extends DeleteDiseaseState {}

class DeleteDiseaseLoadingState extends DeleteDiseaseState {
  final int index;
  DeleteDiseaseLoadingState({required this.index});
}

class DeleteDiseaseDoneState extends DeleteDiseaseState {}

class DeleteDiseaseErrorState extends DeleteDiseaseState {
  final String message;
  DeleteDiseaseErrorState({required this.message});
}
