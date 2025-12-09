class DbCommands {
  static const version = 1;
  static const name = 'ChildAccounts.db';
  static const tableName = 'childAccounts';
  static const idCol = 'id' , firstNameCol = 'firstname' , lastNameCol = 'lastname' , emailCol = 'email' , accountIdCol = 'accountid' , logoCol = 'logo' , userGroupIdCol = 'userGroupId';
  static const createTable = 'CREATE TABLE $tableName ($idCol INTEGER PRIMARY KEY AUTOINCREMENT, $firstNameCol TEXT, $lastNameCol TEXT, $logoCol TEXT, $userGroupIdCol INTEGER, $emailCol TEXT, $accountIdCol INTEGER)';
}