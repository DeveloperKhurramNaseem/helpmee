import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{  
  final AuthService authService;

  AuthRepoImpl(this.authService);

  @override
  Future<(bool, String)> signIn(String email, String password) {
    return authService.signIn(email, password);
  }


  @override
  Future<(bool, String)> signUp(String email, String password) {
    return authService.signUp(email, password);   
  }


  @override
  Future<(bool, String)> verifySignUpOtp(String email, String password) {
    return authService.verifySignUpOtp(email, password);   
  }


}