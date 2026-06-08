part of 'add_family_contact_bloc.dart';

@immutable
sealed class AddFamilyContactState {}

class AddFamilyContactInitialState extends AddFamilyContactState {}

class AddFamilyContactLoadingState extends AddFamilyContactState {}

class AddFamilyContactLoadedState extends AddFamilyContactState {}

class AddFamilyContactErrorState extends AddFamilyContactState {
  final String message;
  AddFamilyContactErrorState({required this.message});
}
