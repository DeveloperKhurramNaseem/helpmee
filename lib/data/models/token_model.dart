
class TokenResponse{

  static const successKey = 'success' , messageKey = 'message' , dataKey = 'data'; 

  bool success;
  String message;
  TokenModel data;
  TokenResponse({required this.success,required this.message,required this.data});

  factory TokenResponse.fromMap(Map<String, dynamic> map) {
    return TokenResponse(
      success: map[successKey],
      message: map[messageKey],
      data: TokenModel.fromMap(map[dataKey] ?? {}),
    );
  }
}

class TokenModel {
  static const accessTokenKey = 'access_token';

  AccessToken accessToken;
  TokenModel({required this.accessToken});

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(accessToken: AccessToken.fromMap(map[accessTokenKey] ?? {}));
  }

  TokenModel.empty():this(accessToken: AccessToken(accessToken: '', refreshToken: ''));
}

class AccessToken {
  static const String accessTokenKey = 'accessToken',
      refreshTokenKey = 'refreshToken';

  String accessToken;
  String refreshToken;

  AccessToken({required this.accessToken, required this.refreshToken});

  factory AccessToken.fromMap(Map<String, dynamic> map) {
    return AccessToken(
      accessToken: map[accessTokenKey] ?? '',
      refreshToken: map[refreshTokenKey] ?? '',
    );
  }
}
