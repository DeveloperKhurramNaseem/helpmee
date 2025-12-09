import 'package:help_mee/util/constants/db_commands.dart';

class ChildAccountModel {
  int id;
  String? logo;
  String? firstName;
  String? lastName;
  String? email;
  int? userGroupId;
  int accountId;

  ChildAccountModel({
    required this.id,
    required this.logo,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userGroupId,
    required this.accountId,
  });

  Map<String, dynamic> toMap() {
    return {
      DbCommands.firstNameCol: firstName,
      DbCommands.logoCol : logo,
      DbCommands.lastNameCol: lastName,
      DbCommands.emailCol: email,
      DbCommands.accountIdCol: accountId,
      DbCommands.userGroupIdCol: userGroupId,
    };
  }

  factory ChildAccountModel.fromMap(Map<String, dynamic> map) {
    return ChildAccountModel(      
      id: map[DbCommands.idCol],
      logo: map[DbCommands.logoCol],
      userGroupId: map[DbCommands.userGroupIdCol],
      firstName: map[DbCommands.firstNameCol],
      lastName: map[DbCommands.lastNameCol],
      email: map[DbCommands.emailCol],
      accountId: map[DbCommands.accountIdCol],
    );
  }
}
