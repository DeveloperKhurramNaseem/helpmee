import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:help_mee/data/repositories/auth_repo_impl.dart';
import 'package:help_mee/data/repositories/user_location_notification_repo_impl.dart';
import 'package:help_mee/data/repositories/user_profile_repo_impl.dart';
import 'package:help_mee/data/repositories/user_repo_impl.dart';
import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/data/source/social_signin_service.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/data/source/user_location_notification_service.dart';
import 'package:help_mee/data/source/user_profile_service.dart';
import 'package:help_mee/data/source/user_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/db_commands.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

var sl = GetIt.instance;

Future<void> init() async {
  await loadAppInfo();
  await initStorage();
  await initAuth();
  await initUser();
  return Future.value(null);
}

Future<void> loadAppInfo() async {
  var packageInfo = await PackageInfo.fromPlatform();
  sl.registerFactory<PackageInfo>(() => packageInfo);
}

Future<void> initAuth() {
  sl.registerFactory<AuthService>(() => AuthService());
  sl.registerFactory<SocialSigninService>(() => SocialSigninService());
  sl.registerFactory<AuthRepo>(() => AuthRepoImpl(sl(), sl(), sl(), sl()));
  return Future.value(null);
}

Future<void> initUser() {
  sl.registerFactory<DeviceInfoPlugin>(() => DeviceInfoPlugin());
  sl.registerFactory<UserService>(() => UserService());
  sl.registerFactory<UserRepo>(() => UserRepoImpl(sl(), sl(), sl(), sl()));
  sl.registerFactory<UserProfileService>(() => UserProfileService());
  sl.registerFactory<UserProfileRepo>(
    () => UserProfileRepoImpl(sl(), sl(), sl()),
  );
  sl.registerFactory<UserLocationNotificationService>(
    () => UserLocationNotificationService(),
  );
  sl.registerFactory<UserLocationNotificationRepo>(
    () => UserLocationNotificationRepoImpl(sl(), sl(), sl()),
  );
  return Future.value(null);
}

Future<void> initStorage() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  var db = await getDatabase();
  sl.registerFactory<TokenService>(() => TokenService(FlutterSecureStorage()));
  sl.registerFactory<StorageService>(
    () => StorageService(sharedPreferences, db),
  );
  return Future.value(null);
}

Future<Database> getDatabase() async {
  var dbsPath = await getDatabasesPath();
  Database database = await openDatabase(
    join(dbsPath, DbCommands.name),
    version: DbCommands.version,
    onCreate: (db, version) {
      db.execute(DbCommands.createTable);
    },
  );
  return database;
}
