import 'dart:convert';
import 'package:help_mee/data/models/app_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const userKey = 'userData' , childAccountsKey = 'childAccounts';
  static const langKey = 'language';

  final SharedPreferences sharedPreferences;

  StorageService(this.sharedPreferences);

  Future<void> saveUser(AppUserModel user) async{
    final data = jsonEncode(user.toMap());
    await sharedPreferences.setString(userKey , data);
  }

  Future<void> saveChildAccounts(List<AppUserModel> accounts) async{
    final data = jsonEncode(accounts.map((e) => e.toMap()).toList());
    await sharedPreferences.setString(childAccountsKey , data);
  }

  List<AppUserModel> getChildAccounts(){
    final data = sharedPreferences.getString(childAccountsKey) ?? '[]';
    return (jsonDecode(data) as List).map((e) => AppUserModel.fromMap(e)).toList();
  }

  AppUserModel getUser(){
    return AppUserModel.fromMap(jsonDecode(sharedPreferences.getString(userKey) ?? '{"pin_code": null}'));
  }

    String getLanguage() {
    return sharedPreferences.getString(langKey) ?? 'en';
  }

  Future<void> saveLanguage(String language) async {
    await sharedPreferences.setString(langKey, language);
  }

  Future<void> clearData() async{
    await sharedPreferences.clear();
  }  
}