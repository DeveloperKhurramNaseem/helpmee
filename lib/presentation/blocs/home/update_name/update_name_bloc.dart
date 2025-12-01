import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:meta/meta.dart';

part 'update_name_event.dart';
part 'update_name_state.dart';

class UpdateNameBloc extends Bloc<UpdateNameEvent, UpdateNameState> {
  final UserProfileRepo userProfileRepo;
  UpdateNameBloc(this.userProfileRepo) : super(UpdateNameInitialState()) {
    on<UpdateNameInitEvent>(_handleUpdateNameInitEvent);
  }

  FutureOr<void> _handleUpdateNameInitEvent(
    UpdateNameInitEvent event,
    Emitter<UpdateNameState> emit,
  ) async {
    try {
      emit(UpdateNameLoadingState());
      var result = await userProfileRepo.updateName(
        event.firstName,
        event.lastName,
        event.token,        
      );
      if (result.$1) {
        emit(UpdateNameDoneState(event.accountId));
      } else {
        emit(UpdateNameErrorState(message: result.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'UpdateNameBloc');
      emit(UpdateNameErrorState(message: 'An unexpected error occurred.'));
    }
  }
}
