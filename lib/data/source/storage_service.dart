import 'dart:convert';
import 'package:help_mee/data/models/app_user_model.dart';
import 'package:help_mee/data/models/child_account_model.dart';
import 'package:help_mee/util/constants/db_commands.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class StorageService {
  static const userKey = 'userData', childAccountsKey = 'childAccounts';
  static const langKey = 'language';

  final SharedPreferences sharedPreferences;
  final Database database;

  StorageService(this.sharedPreferences, this.database);

  Future<void> saveUser(AppUserModel user) async {
    final data = jsonEncode(user.toMap());
    await sharedPreferences.setString(userKey, data);
  }

  // Future<void> saveChildAccounts(List<AppUserModel> accounts) async {
  //   final data = jsonEncode(accounts.map((e) => e.toMap()).toList());
  //   await sharedPreferences.setString(childAccountsKey, data);
  // }

  AppUserModel getUser() {
    return AppUserModel.fromMap(
      jsonDecode(sharedPreferences.getString(userKey) ?? '{"pin_code": null}'),
    );
  }

  String getLanguage() {
    return sharedPreferences.getString(langKey) ?? 'en';
  }

  Future<void> saveLanguage(String language) async {
    await sharedPreferences.setString(langKey, language);
  }

  Future<void> clearData() async {
    await sharedPreferences.clear();
    await clearUsers();
  }

  Future<int> addChild(ChildAccountModel childUser) async {
    return await database.insert(DbCommands.tableName, childUser.toMap());
  }

  Future<void> addMultipleChilds(List<ChildAccountModel> childUsers) async {
    await database.transaction((txn) async {
      for (var user in childUsers) {
        await txn.insert(DbCommands.tableName, user.toMap());
      }
    });
  }

  Future<void> clearUsers() async {
    await database.delete(DbCommands.tableName);
  }

  /// UPDATE USER
  Future<int> updateChild(ChildAccountModel childUser) async {
    return await database.update(
      DbCommands.tableName,
      childUser.toMap(),
      where: "${DbCommands.accountIdCol} = ?",
      whereArgs: [childUser.accountId],
    );
  }

  /// DELETE USER
  Future<int> deleteChild(int id) async {
    return await database.delete(
      DbCommands.tableName,
      where: "${DbCommands.idCol} = ?",
      whereArgs: [id],
    );
  }

  Future<List<ChildAccountModel>> getChildAccounts() async {
    var result = await database.query(DbCommands.tableName);
    return result.map((e) => ChildAccountModel.fromMap(e)).toList();
  }
}
