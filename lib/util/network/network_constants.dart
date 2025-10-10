import 'dart:convert';

class NetworkConstants {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

DecodedResponse decodeResponse(String json) {
  var response = jsonDecode(json);
  return DecodedResponse(
    success: response['success'] as bool,
    message: response['message'] as String,
    data: response['data'] as dynamic,
  );
}


class DecodedResponse{
  bool success;
  String message;
  dynamic data;

  DecodedResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DecodedResponse.fromMap(Map<String, dynamic> map) {
    return DecodedResponse(success: map['success'], message: map['message'], data: map['data']);
  }

  Map<String, dynamic> toMap(){
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
}