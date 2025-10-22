import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'resend_otp_event.dart';
part 'resend_otp_state.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
  final AuthRepo authRepo;
  ResendOtpBloc(this.authRepo) : super(ResendOtpInitialState()) {
    on<ResendOtpNowEvent>(_handleResendOtpEvent);
  }

  FutureOr<void> _handleResendOtpEvent(
    ResendOtpNowEvent event,
    Emitter<ResendOtpState> emit,
  ) async {
    try {
      emit(ResendOtpLoadingState());
      var result = await authRepo.resendOtp(event.email);
      if (result.$1) {
        emit(ResendOtpDoneState(result.$2));
      } else {
        emit(ResendOtpErrorState(result.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'ResendOtpBloc Error');
      emit(ResendOtpErrorState(ErrorConstants.errorMessage));
    }
  }
}
