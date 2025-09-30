import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{  
  final AuthService authService;

  AuthRepoImpl(this.authService);

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }


  @override
  Future<(bool, String)> signUp(String email, String password) {
    return authService.signUp(email, password);   
  }
}