part of 'lock_disease_bloc.dart';

@immutable
sealed class LockDiseaseEvent {}

class LockCurrentDiseaseEvent extends LockDiseaseEvent{
  final int diseaseId;
  final int index;
  final String status;
  LockCurrentDiseaseEvent(this.diseaseId , this.index, this.status);
}
