import 'package:get_it/get_it.dart';
import 'package:help_mee/data/repositories/auth_repo_impl.dart';
import 'package:help_mee/data/source/auth_service.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';

var sl = GetIt.instance;

Future<void> init(){
  initAuth();
  return Future.value(null);
}

Future<void> initAuth(){
  sl.registerFactory<AuthService>(() => AuthService());
  sl.registerFactory<AuthRepo>(() => AuthRepoImpl(sl()));
  return Future.value(null);
}