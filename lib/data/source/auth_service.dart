import 'dart:io';

import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';

class AuthService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, String)> signUp(String email, String password) async {
    var result = await post(EndPoints.signUp ,{
      'email': email,
      'password': password,
      'device_type': Platform.isAndroid ? 'ANDROID' : 'IOS',
    } , header: NetworkConstants.headers);

    if (result != null) {
      return (result.success, result.message);
    }
    return (false, 'Something went wrong');
  }

    Future<(bool, String)> signIn(String email, String password) async {
    var result = await post(EndPoints.signIn ,{
      'email': email,
      'password': password,      
    } , header: NetworkConstants.headers);

    if (result != null) {
      return (result.success, result.message);
    }
    return (false, 'Something went wrong');
  }

  Future<(bool,String)> verifySignUpOtp(String email, String otp) async{
    var result = await post(EndPoints.verifySignUpOtp, {
      'email' : email,
      'otp' : otp      
    } , header: NetworkConstants.headers);
if (result != null) {
      return (result.success, result.message);
    }
    return (false, 'Something went wrong');

  }
}
