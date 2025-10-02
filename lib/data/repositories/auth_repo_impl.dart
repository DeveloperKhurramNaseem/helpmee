import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{  
  final AuthService authService;
  final TokenService tokenService;

  AuthRepoImpl(this.authService, this.tokenService);

  @override
  Future<(bool, String)> signIn(String email, String password) async{
    var result = await authService.signIn(email, password);
    await tokenService.saveToken(result.data.accessToken.accessToken);
    return (result.success , result.message);
  }


  @override
  Future<(bool, String)> signUp(String email, String password) {
    return authService.signUp(email, password);   
  }


  @override
  Future<(bool, String)> verifySignUpOtp(String email, String password) async {
    var result = await authService.verifySignUpOtp(email, password);  
    await tokenService.saveToken(result.data.accessToken.accessToken);    
    return (result.success , result.message); 
  }

}