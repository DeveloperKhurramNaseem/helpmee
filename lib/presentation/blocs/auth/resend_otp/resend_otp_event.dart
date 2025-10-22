part of 'resend_otp_bloc.dart';

@immutable
sealed class ResendOtpEvent {}

class ResendOtpNowEvent extends ResendOtpEvent{
  final String email;

  ResendOtpNowEvent(this.email);
}
