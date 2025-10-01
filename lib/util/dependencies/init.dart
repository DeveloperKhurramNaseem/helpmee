import 'package:get_it/get_it.dart';
import 'package:help_mee/data/repositories/auth_repo_impl.dart';
import 'package:help_mee/data/repositories/user_repo_impl.dart';
import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/data/source/user_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';

var sl = GetIt.instance;

Future<void> init(){
  initAuth();
  initUser();
  return Future.value(null);
}

Future<void> initAuth(){
  sl.registerFactory<AuthService>(() => AuthService());
  sl.registerFactory<AuthRepo>(() => AuthRepoImpl(sl()));  
  return Future.value(null);
}

Future<void> initUser(){
  sl.registerFactory<UserService>(() => UserService());
  sl.registerFactory<UserRepo>(() => UserRepoImpl(sl()));
   return Future.value(null);
}