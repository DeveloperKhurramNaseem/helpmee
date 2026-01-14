import 'package:help_mee/data/models/signin_response.dart';
import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/data/source/social_signin_service.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;
  final TokenService tokenService;
  final StorageService storageService;
  final SocialSigninService socialSigninService;

  AuthRepoImpl(
    this.authService,
    this.tokenService,
    this.storageService,
    this.socialSigninService,
  );

  @override
  Future<SigninResponse> signIn(String email, String password) async {
    var lang = storageService.getLanguage();
    var result = await authService.signIn(email, password, lang);
    // Not saving token on sign in if there are no activated products
    if (result.activatedProducts != 0) {
      await tokenService.saveToken(result.data.accessToken.accessToken);
      await storageService.saveUser(result.user);
    }    
    return result;
  }

  @override
  Future<(bool, String)> signUp(String email, String password) {
    var lang = storageService.getLanguage();
    return authService.signUp(email, password, lang);
  }

  @override
  Future<(bool, String, String)> verifySignUpOtp(
    String email,
    String otp,
  ) async {
    var lang = storageService.getLanguage();
    var result = await authService.verifySignUpOtp(email, otp, lang);
    // Not saving token on sign up
    // await tokenService.saveToken(result.data.accessToken.accessToken);
    return (
      result.success,
      result.message,
      result.data.accessToken.accessToken,
    );
  }

  @override
  Future<(bool, String)> forgetPasswordSendCode(String email) async {
    var lang = storageService.getLanguage();
    var result = await authService.forgetPasswordSendCode(email, lang);
    return (result.$1, result.$2);
  }

  @override
  Future<(bool, String)> createNewPassword(String email, String password) {
    var lang = storageService.getLanguage();
    return authService.createNewPassword(email, password, lang);
  }

  @override
  Future<(bool, String)> verifyForgetPasswordOtp(
    String email,
    String otp,
  ) async {
    var lang = storageService.getLanguage();
    var result = await authService.verifyForgetPasswordOtp(email, otp, lang);
    // Not saving token on sign up
    // await tokenService.saveToken(result.data.accessToken.accessToken);
    return (result.$1, result.$2);
  }

  @override
  Future<(bool, String)> resendOtp(String email) {
    var lang = storageService.getLanguage();
    return authService.resendOtp(email, lang);
  }

  @override
  Future<SigninResponse?> signInWithApple() async  {
    var lang = storageService.getLanguage();
    var idToken = await socialSigninService.signInWithApple();
    if (idToken != null) {
      var result = await authService.socialSignIn(idToken, lang);
      if (result.activatedProducts != 0) {
        await tokenService.saveToken(result.data.accessToken.accessToken);
        await storageService.saveUser(result.user);
      }
      return result;
    }
    return null;
  }

  @override
  Future<SigninResponse?> signInWithGoogle() async {
    var lang = storageService.getLanguage();
    var socialSignInData = await socialSigninService.signInWithGoogle();
    if (socialSignInData != null) {
      var result = await authService.socialSignIn(socialSignInData, lang);
      if (result.activatedProducts != 0) {
        await tokenService.saveToken(result.data.accessToken.accessToken);
        await storageService.saveUser(result.user);
      }
      return result;
    }
    return null;
  }
}
