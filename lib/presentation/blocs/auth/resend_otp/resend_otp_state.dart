part of 'resend_otp_bloc.dart';

@immutable
sealed class ResendOtpState {}

class ResendOtpInitialState extends ResendOtpState {}

class ResendOtpLoadingState extends ResendOtpState {}

class ResendOtpDoneState extends ResendOtpState {
  final String message;

  ResendOtpDoneState([this.message = '']);
}

class ResendOtpErrorState extends ResendOtpState {
  final String message;

  ResendOtpErrorState(this.message);
}
