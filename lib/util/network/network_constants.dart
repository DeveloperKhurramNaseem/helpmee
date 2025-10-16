import 'dart:convert';

class NetworkConstants {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const acceptLanguage = 'Accept-Language';
  static const authorization = 'Authorization';
  static const bearer = 'Bearer';

  static Map<String, String> getHeaders([String? lang,String? token]) {
    return {
      ...NetworkConstants.headers,
      if(token != null)
      NetworkConstants.authorization: '${NetworkConstants.bearer} $token',
      if(lang != null)
      NetworkConstants.acceptLanguage: lang,
    };
  }

  
}

DecodedResponse decodeResponse(String json) {
  var response = jsonDecode(json);
  return DecodedResponse(
    success: response['success'] as bool,
    message: response['message'] as String,
    data: response['data'] as dynamic,
  );
}

DecodedResponseWithMessagesList decodeResponseWithMessagesList(String json) {
  var response = jsonDecode(json);
  return DecodedResponseWithMessagesList(
    success: response['success'] as bool,
    message: List<String>.from(
      (response['message'] is List)
          ? response['message']
          : [response['message']],
    ),
    data: response['data'] as dynamic,
  );
}

class DecodedResponse {
  bool success;
  String message;
  dynamic data;

  DecodedResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DecodedResponse.fromMap(Map<String, dynamic> map) {
    return DecodedResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'message': message, 'data': data};
  }
}

class DecodedResponseWithMessagesList {
  bool success;
  List<String> message;
  dynamic data;

  DecodedResponseWithMessagesList({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DecodedResponseWithMessagesList.fromMap(Map<String, dynamic> map) {
    return DecodedResponseWithMessagesList(
      success: map['success'],
      message: map['message'],
      data: map['data'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'message': message, 'data': data};
  }
}
