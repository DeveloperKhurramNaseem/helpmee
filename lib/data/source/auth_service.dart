import 'dart:developer';
import 'dart:io';
import 'package:help_mee/data/models/signin_response.dart';
import 'package:help_mee/data/models/token_model.dart';
import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';

class AuthService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, String)> signUp(
    String email,
    String password,
    String language,
  ) async {
    var result = await post(
      EndPoints.signUp,
      {
        'email': email,
        'password': password,
        'device_type': Platform.isAndroid ? 'ANDROID' : 'IOS',
      },
      header: NetworkConstants.getHeaders(language),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<SigninResponse> signIn(
    String email,
    String password,
    String language,
  ) async {
    var result = await post(
      EndPoints.signIn,
      {'email': email, 'password': password},
      header: NetworkConstants.getHeaders(language),
    );

    if (result != null) {
      final decodedResponse = decodeResponse(result);
      log(decodedResponse.toMap().toString(), name: 'SignInResponse');
      if (decodedResponse.success) {
        return SigninResponse.fromMap(decodedResponse.toMap());
      } else {
        return SigninResponse.empty(decodedResponse.message);
      }
    }
    return SigninResponse.empty(ErrorConstants.errorMessage);
  }

  Future<TokenResponse> verifySignUpOtp(
    String email,
    String otp,
    String language,
  ) async {
    var result = await post(
      EndPoints.verifySignUpOtp,
      {'email': email, 'otp': otp},
      header: NetworkConstants.getHeaders(language),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return TokenResponse.fromMap(decodedResponse.toMap());
    }
    return TokenResponse(
      success: false,
      message: ErrorConstants.errorMessage,
      data: TokenModel.empty(),
    );
  }

  Future<TokenResponse> forgetPassword(String email, String language) async {    
    var result = await post(
      EndPoints.forgetPassword,
      {'email': email},
      header: NetworkConstants.getHeaders(language),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return TokenResponse.fromMap(decodedResponse.toMap());
    }
    return TokenResponse(
      success: false,
      message: ErrorConstants.errorMessage,
      data: TokenModel.empty(),
    );
  }

    Future<(bool,String)> forgetPasswordSendCode(String email, String language) async{
     var result = await post(
      EndPoints.forgetPasswordSendCode,
      {'email': email},
      header: NetworkConstants.getHeaders(language),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success , decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

    Future<(bool,String)> verifyForgetPasswordOtp(
    String email,
    String otp,
    String language,
  ) async {
    var result = await post(
      EndPoints.verifyForgetPasswordOtp,
      {'email': email, 'vcode': otp},
      header: NetworkConstants.getHeaders(language),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool,String)> createNewPassword(String email, String password, String language) async{
    var result = await post(
      EndPoints.createNewPassword,
      {'email': email, 'password': password},
      header: NetworkConstants.getHeaders(language)
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }
}
