import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/util/constants/app_enums.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepo authRepo;
  VerifyOtpBloc(this.authRepo) : super(VerifyOtpInitialState()) {
    on<VerifySignUpOtpEvent>(_handleVerifySignUpOtpEvent);
    on<VerifySignUpOtpResetEvent>(_handleVerifySignupOtpResetEvent);
  }

  FutureOr<void> _handleVerifySignUpOtpEvent(
    VerifySignUpOtpEvent event,
    Emitter<VerifyOtpState> emit,
  ) async {
    try {
      emit(VerifyOtpLoadingState());
      if (event.currentState == EnterCodeScreenState.signUp) {
        var result = await authRepo.verifySignUpOtp(event.email, event.otp);
        if (result.$1) {
          emit(VerifyOtpDoneState(message: result.$2, token: result.$3));
        } else {
          emit(VerifyOtpErrorState(result.$2));
        }
      }else if(event.currentState == EnterCodeScreenState.forgetPassword){
        var result = await authRepo.verifyForgetPasswordOtp(event.email, event.otp);
        if (result.$1) {
          emit(VerifyOtpForgetPasswordDoneState(message: result.$2));
        } else {
          emit(VerifyOtpErrorState(result.$2));
        }
      }
    } catch (e) {
      log(e.toString(), name: 'VerifyOtpBloc Error');
      emit(VerifyOtpErrorState(ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleVerifySignupOtpResetEvent(
    VerifySignUpOtpResetEvent event,
    Emitter<VerifyOtpState> emit,
  ) {
    emit(VerifyOtpInitialState());
  }
}
