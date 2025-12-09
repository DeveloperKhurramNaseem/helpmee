import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_profile_event.dart';
part 'delete_profile_state.dart';

class DeleteProfileBloc extends Bloc<DeleteProfileEvent, DeleteProfileState> {
  final UserRepo userRepo;
  DeleteProfileBloc(this.userRepo) : super(DeleteProfileInitialState()) {
    on<DeleteProfileAccountEvent>(_handleDeleteProfileEvent);
  }

  FutureOr<void> _handleDeleteProfileEvent(
    DeleteProfileAccountEvent event,
    Emitter<DeleteProfileState> emit,
  ) async {
    try {
      emit(DeleteProfileLoadingState());
      var result = await userRepo.deleteAccount();
      if(result.$1){
        emit(DeleteProfileDoneState());
      }else{
      emit(DeleteProfileErrorState(result.$2));
      }
    } catch (e) {
      log(e.toString() , name: 'Delete Profile Bloc');
      emit(DeleteProfileErrorState(ErrorConstants.errorMessage));
    }
  }
}
