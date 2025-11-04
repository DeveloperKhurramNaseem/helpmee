part of 'delete_disease_bloc.dart';

@immutable
sealed class DeleteDiseaseEvent {}

class DeleteCurrentDiseaseEvent extends DeleteDiseaseEvent{
  final int diseaeId;
  final int index;
  DeleteCurrentDiseaseEvent(this.diseaeId,this.index);
}
