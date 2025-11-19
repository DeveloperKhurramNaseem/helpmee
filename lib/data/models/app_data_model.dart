import 'package:help_mee/data/models/app_user_model.dart';

class AppDataModel {

  static const String userKey = 'user' , childAccountsKey = 'child_accounts';

  AppUserModel user;
  List<AppUserModel>?  childAccounts;

  AppDataModel({
    required this.user,
    this.childAccounts,
  });

  Map<String, dynamic> toMap() {
    return {
      userKey: user.toMap(),
      childAccountsKey: childAccounts?.map((e) => e.toMap()).toList(),
    };
  }

  factory AppDataModel.fromMap(Map<String, dynamic> map) {
    return AppDataModel(
      user: AppUserModel.fromMap(map[userKey]),
      childAccounts: map[childAccountsKey] != null ? (map[childAccountsKey] as List).map((e) => AppUserModel.fromMap(e)).toList() : null,
    );
  }
}