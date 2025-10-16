import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final UserRepo userRepo;
  ChangePasswordBloc(this.userRepo) : super(ChangePasswordInitialState()) {
    on<ChangeCurrentPasswordEvent>(_handleChangePasswordEvent);
    on<ShowErrorEvent>(_handleShowErrorEvent);
  }

  FutureOr<void> _handleChangePasswordEvent(ChangeCurrentPasswordEvent event, Emitter<ChangePasswordState> emit) async{
    try{
      emit(ChangePasswordLoadingState());
      var result = await userRepo.changePassword(event.currentPassword, event.newPassword);
      if(result.$1){
        emit(ChangePasswordDoneState(result.$2));
      }else{
        emit(ChangePasswordErrorState(result.$2));
      }      
    }catch(e){
      log(e.toString());
      emit(ChangePasswordErrorState(ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleShowErrorEvent(ShowErrorEvent event, Emitter<ChangePasswordState> emit) {
    emit(ChangePasswordErrorState(event.message));
  }
}
