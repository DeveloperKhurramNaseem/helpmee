import 'package:help_mee/data/models/app_user_model.dart';
import 'package:help_mee/data/models/token_model.dart';

class SigninResponse {
  static const successKey = 'success' , messageKey = 'message' , dataKey = 'data' , activatedProductsKey = 'activated_devices'; 

  bool success;
  String message;
  TokenModel data;
  AppUserModel user;
  int activatedProducts;
  SigninResponse({required this.success,required this.message,required this.data, required this.user, required this.activatedProducts});

  factory SigninResponse.fromMap(Map<String, dynamic> map) {
    return SigninResponse(
      success: map[successKey],
      message: map[messageKey],
      data: TokenModel.fromMap(map[dataKey] ?? ''),
      user: AppUserModel.fromMap(map[dataKey]['user'] ?? ''),
      activatedProducts: map[dataKey][activatedProductsKey] ?? 0
    );
  }

  SigninResponse.empty(String message): this(success: false, message: message, data: TokenModel.empty(), user: AppUserModel.fromMap({}) , activatedProducts: 0);
}
