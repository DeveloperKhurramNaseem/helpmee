import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:help_mee/data/repositories/auth_repo_impl.dart';
import 'package:help_mee/data/repositories/user_repo_impl.dart';
import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/data/source/user_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';

var sl = GetIt.instance;

Future<void> init() async{
  await initStorage();
  await initAuth();
  await initUser();  
  return Future.value(null);
}

Future<void> initAuth(){
  sl.registerFactory<AuthService>(() => AuthService());
  sl.registerFactory<AuthRepo>(() => AuthRepoImpl(sl(),sl()));  
  return Future.value(null);
}

Future<void> initUser(){
  sl.registerFactory<UserService>(() => UserService());
  sl.registerFactory<UserRepo>(() => UserRepoImpl(sl(),sl()));
   return Future.value(null);
}

Future<void> initStorage(){  
  sl.registerFactory<TokenService>(() => TokenService(FlutterSecureStorage()));
  return Future.value(null);
}