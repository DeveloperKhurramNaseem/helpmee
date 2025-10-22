import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'create_password_event.dart';
part 'create_password_state.dart';

class CreatePasswordBloc extends Bloc<CreatePasswordEvent, CreatePasswordState> {
  final AuthRepo authRepo;
  CreatePasswordBloc(this.authRepo) : super(CreatePasswordInitialState()) {
    on<CreateNewPasswordEvent>(_handleNewPasswordCreationEvent);
    on<ShowErrorEvent>(_handleShowErrorEvent);
    on<ResetErrorEvent>(_handleResetErrorEvent);
  }

  FutureOr<void> _handleNewPasswordCreationEvent(CreateNewPasswordEvent event, Emitter<CreatePasswordState> emit) async{
    try{
      emit(CreatePasswordLoadingState());
      var result = await authRepo.createNewPassword(event.email,event.password);
      if(result.$1){
        emit(CreatePasswordDoneState(result.$2));
      }else{
        emit(CreatePasswordErrorState(result.$2));
      }
    }catch(e){
      emit(CreatePasswordErrorState(ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleShowErrorEvent(ShowErrorEvent event, Emitter<CreatePasswordState> emit) {
    emit(CreatePasswordErrorState(event.message));
  }

  FutureOr<void> _handleResetErrorEvent(ResetErrorEvent event, Emitter<CreatePasswordState> emit) {
    emit(CreatePasswordInitialState());
  }
}
