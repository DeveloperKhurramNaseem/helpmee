import 'dart:io';

import 'package:help_mee/data/models/signin_response.dart';
import 'package:help_mee/data/models/token_model.dart';
import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';

class AuthService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, String)> signUp(String email, String password) async {
    var result = await post(EndPoints.signUp, {
      'email': email,
      'password': password,
      'device_type': Platform.isAndroid ? 'ANDROID' : 'IOS',
    }, header: NetworkConstants.headers);

    if (result != null) {
      return (result.success, result.message);
    }
    return (false, 'Something went wrong');
  }

  Future<SigninResponse> signIn(String email, String password) async {
    var result = await post(EndPoints.signIn, {
      'email': email,
      'password': password,
    }, header: NetworkConstants.headers);

    if (result != null) {
      return SigninResponse.fromMap(result.toMap());
    }
    return SigninResponse.empty();
  }

  Future<TokenResponse> verifySignUpOtp(String email, String otp) async {
    var result = await post(EndPoints.verifySignUpOtp, {
      'email': email,
      'otp': otp,
    }, header: NetworkConstants.headers);
    if (result != null) {
      
      return TokenResponse.fromMap(result.toMap());
    }    
    return TokenResponse(success: false, message: 'Something went wrong', data: TokenModel.empty());
  }
}
