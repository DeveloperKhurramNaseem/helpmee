import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepo authRepo;
  VerifyOtpBloc(this.authRepo) : super(VerifyOtpInitialState()) {
    on<VerifySignUpOtpEvent>(_handleVerifySignUpOtpEvent);
  }

  FutureOr<void> _handleVerifySignUpOtpEvent(
    VerifySignUpOtpEvent event,
    Emitter<VerifyOtpState> emit,
  ) async {
    try{
      emit(VerifyOtpLoadingState());
      var result = await authRepo.verifySignUpOtp(event.email, event.otp);
      if(result.$1){
        emit(VerifyOtpDoneState(result.$2));
      }else{
        emit(VerifyOtpErrorState(result.$2));
      }
    }catch(e){
      log(e.toString() , name: 'VerifyOtpBloc Error');
      emit(VerifyOtpErrorState('Something went wrong'));
    }
  }
}
