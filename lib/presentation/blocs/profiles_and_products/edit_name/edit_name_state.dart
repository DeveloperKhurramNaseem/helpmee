part of 'edit_name_bloc.dart';

@immutable
sealed class EditNameState {}

class EditNameInitialState extends EditNameState {}

class EditNameLoadingState extends EditNameState {}

class EditNameLoadedState extends EditNameState {}

class EditNameErrorState extends EditNameState {
  final String message;
  EditNameErrorState(this.message);
}
