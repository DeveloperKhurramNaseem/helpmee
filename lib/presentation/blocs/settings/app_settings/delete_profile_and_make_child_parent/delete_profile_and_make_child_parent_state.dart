part of 'delete_profile_and_make_child_parent_bloc.dart';

@immutable
sealed class DeleteProfileAndMakeChildParentState {}

class DeleteProfileAndMakeChildParentInitialState
    extends DeleteProfileAndMakeChildParentState {}

    class DeleteProfileAndMakeChildParentLoadingState
    extends DeleteProfileAndMakeChildParentState {}


    class DeleteProfileAndMakeChildParentDoneState
    extends DeleteProfileAndMakeChildParentState {}

    class DeleteProfileAndMakeChildParentErrorState
    extends DeleteProfileAndMakeChildParentState {
      final String message;
      DeleteProfileAndMakeChildParentErrorState({required this.message});
    }
