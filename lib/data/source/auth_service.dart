import 'dart:io';

import 'package:help_mee/util/network/api_service.dart';

class AuthService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, String)> signUp(String email, String password) async {
    var result = await post({
      'email': email,
      'password': password,
      'device_type': Platform.isAndroid ? 'ANDROID' : 'IOS',
    } , endPoint: '/signup' , header: {'Content-Type': 'application/json' , 'Accept' : 'application/json'});

    if (result != null) {
      return (result['success'] as bool, result['message'] as String);
    }
    return (false, 'Something went wrong');
  }
}
