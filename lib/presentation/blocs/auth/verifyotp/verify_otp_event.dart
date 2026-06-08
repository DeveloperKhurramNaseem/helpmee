part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpEvent {}

class VerifySignUpOtpEvent extends VerifyOtpEvent{
  final String otp;
  final String email;
  final EnterCodeScreenState currentState;
  VerifySignUpOtpEvent(this.otp, this.email, this.currentState);
}


class VerifySignUpOtpResetEvent extends VerifyOtpEvent{ 
  VerifySignUpOtpResetEvent();
}