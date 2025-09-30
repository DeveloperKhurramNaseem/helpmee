import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/signup/signup_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_state.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';

List<BlocProvider> getUniversalBlocProviders() {
  return [
    BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc(
        LanguageState(LocalizationUtil.locales[LocalizationUtil.english]!),
      ),
    ),
  ];
}


List<BlocProvider> getAuthBlocProviders(){
  return [
    BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(
        sl(),
      ),
    ),
  ];
}