part of 'lock_disease_bloc.dart';

@immutable
sealed class LockDiseaseState {}

class LockDiseaseInitialState extends LockDiseaseState {}

class LockDiseaseLoadingState extends LockDiseaseState {
  final int index;

  LockDiseaseLoadingState({required this.index});
}


class LockDiseaseDoneState extends LockDiseaseState {}


class LockDiseaseErrorState extends LockDiseaseState {
  final String message;

  LockDiseaseErrorState({required this.message});
}
