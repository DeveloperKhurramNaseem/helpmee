abstract class AuthRepo {
  Future<(bool,String)> signIn(String email, String password);
  Future<(bool,String)> signUp(String email, String password);  
  Future<(bool, String)> verifySignUpOtp(String email, String otp);
}