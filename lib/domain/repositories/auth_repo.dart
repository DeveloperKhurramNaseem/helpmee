abstract class AuthRepo {
  Future<void> signIn(String email, String password);
  Future<(bool,String)> signUp(String email, String password);  
}