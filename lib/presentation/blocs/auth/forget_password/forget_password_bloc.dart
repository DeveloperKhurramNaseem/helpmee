import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../util/constants/error_constants.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
      final AuthRepo authRepo;
  ForgetPasswordBloc(this.authRepo) : super(ForgetPasswordInitialState()) {
    on<ForgetPasswordInitEvent>(_handleForgetPasswordEvent);
  }

  FutureOr<void> _handleForgetPasswordEvent(ForgetPasswordInitEvent event, Emitter<ForgetPasswordState> emit) async{
    try{
      emit(ForgetPasswordLoadingState());
      var result = await authRepo.forgetPasswordSendCode(event.email);
      if(result.$1){
        emit(ForgetPasswordLoadedState(message: result.$2));
      }else{
        emit(ForgetPasswordErrorState(message: result.$2));
      }
    }catch(e){
      emit(ForgetPasswordErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
