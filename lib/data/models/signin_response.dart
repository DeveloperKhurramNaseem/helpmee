import 'package:help_mee/data/models/token_model.dart';

class SigninResponse {
  static const successKey = 'success' , messageKey = 'message' , dataKey = 'data'; 

  bool success;
  String message;
  TokenModel data;
  SigninResponse({required this.success,required this.message,required this.data});

  factory SigninResponse.fromMap(Map<String, dynamic> map) {
    return SigninResponse(
      success: map[successKey],
      message: map[messageKey],
      data: TokenModel.fromMap(map[dataKey] ?? ''),
    );
  }

  SigninResponse.empty(): this(success: false, message: '', data: TokenModel.empty());
}
