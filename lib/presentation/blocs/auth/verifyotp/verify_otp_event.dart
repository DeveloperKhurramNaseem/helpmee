part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpEvent {}

class VerifySignUpOtpEvent extends VerifyOtpEvent{
  final String otp;
  final String email;
  VerifySignUpOtpEvent(this.otp, this.email);
}
