part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpState {}

class VerifyOtpInitialState extends VerifyOtpState {}

class VerifyOtpLoadingState extends VerifyOtpState {}

class VerifyOtpDoneState extends VerifyOtpState {
  final String message;

  VerifyOtpDoneState(this.message);
}

class VerifyOtpErrorState extends VerifyOtpState {
  final String message;

  VerifyOtpErrorState(this.message);
}
