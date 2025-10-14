import 'dart:convert';
import 'package:help_mee/data/models/app_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const userKey = 'userData';
  final SharedPreferences sharedPreferences;

  StorageService(this.sharedPreferences);

  Future<void> saveUser(AppUserModel user) async{
    final data = jsonEncode(user.toMap());
    await sharedPreferences.setString(userKey , data);
  }

  AppUserModel getUser(){
    return AppUserModel.fromMap(jsonDecode(sharedPreferences.getString(userKey) ?? '{}'));
  }
}