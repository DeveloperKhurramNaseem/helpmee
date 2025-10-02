import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static const _tokenKey = 'tokenKey';
  final FlutterSecureStorage storage;  

  TokenService(this.storage);

  Future<String> getToken() async {
    return await storage.read(key: _tokenKey) ?? '';
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }
}