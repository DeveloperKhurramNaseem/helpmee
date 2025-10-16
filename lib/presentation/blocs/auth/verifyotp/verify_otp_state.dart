part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpState {}

class VerifyOtpInitialState extends VerifyOtpState {}

class VerifyOtpLoadingState extends VerifyOtpState {}

class VerifyOtpDoneState extends VerifyOtpState {
  final String message;
  final String token;
  VerifyOtpDoneState({required this.message , required this.token});
}

class VerifyOtpForgetPasswordDoneState extends VerifyOtpState {
  final String message;  
  VerifyOtpForgetPasswordDoneState({required this.message});
}


class VerifyOtpErrorState extends VerifyOtpState {
  final String message;

  VerifyOtpErrorState(this.message);
}
