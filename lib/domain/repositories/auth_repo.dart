import 'package:help_mee/data/models/signin_response.dart';

abstract class AuthRepo {
  Future<SigninResponse> signIn(String email, String password);
  Future<SigninResponse?> signInWithGoogle();
  Future<SigninResponse?> signInWithApple();
  Future<(bool,String)> signUp(String email, String password);  
  Future<(bool, String, String)> verifySignUpOtp(String email, String otp);
  Future<(bool, String)> createNewPassword(String email, String password);
  Future<(bool,String)> forgetPasswordSendCode(String email);
  Future<(bool, String)> verifyForgetPasswordOtp(String email, String otp); 
  Future<(bool, String)> resendOtp(String email);
}