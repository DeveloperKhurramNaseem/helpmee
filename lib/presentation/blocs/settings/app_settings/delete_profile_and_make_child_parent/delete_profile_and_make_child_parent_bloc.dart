import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_profile_and_make_child_parent_event.dart';
part 'delete_profile_and_make_child_parent_state.dart';

class DeleteProfileAndMakeChildParentBloc
    extends
        Bloc<
          DeleteProfileAndMakeChildParentEvent,
          DeleteProfileAndMakeChildParentState
        > {
  final UserRepo userRepo;
  DeleteProfileAndMakeChildParentBloc(this.userRepo)
    : super(DeleteProfileAndMakeChildParentInitialState()) {
    on<DeleteProfileAndMakeChildParentEvent>(
      _handleDeleteProfileAndMakeChildParent,
    );
  }

  FutureOr<void> _handleDeleteProfileAndMakeChildParent(
    DeleteProfileAndMakeChildParentEvent event,
    Emitter<DeleteProfileAndMakeChildParentState> emit,
  ) async {
    try {
      emit(DeleteProfileAndMakeChildParentLoadingState());
      var result = await userRepo.deleteProfileAndMakeChildParent(event.deleteId);
      if (result.$1) {
        emit(DeleteProfileAndMakeChildParentDoneState());
      } else {
        emit(DeleteProfileAndMakeChildParentErrorState(message: result.$2));
      }
    } catch (e) {
      log(e.toString());
      emit(
        DeleteProfileAndMakeChildParentErrorState(
          message: ErrorConstants.errorMessage,
        ),
      );
    }
  }
}
