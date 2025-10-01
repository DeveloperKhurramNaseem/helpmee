import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_state.dart';
import 'package:help_mee/presentation/screens/home/dashboard/dashboard.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';
import 'package:help_mee/util/providers/bloc_providers.dart';
import 'package:help_mee/util/theme/light_theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ProvidersWrapper(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize(MediaQuery.of(context).size);
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return Builder(
          builder: (context) {
            return MaterialApp(
              title: 'HelpMee',
              theme: LightTheme.data,
              themeMode: ThemeMode.light,
              localizationsDelegates: LocalizationUtil.delegates,
              supportedLocales: LocalizationUtil.locales.values,
              locale: state.locale,
              home: const Dashboard(),
            );
          }
        );
      },
    );
  }
}

class ProvidersWrapper extends StatelessWidget {
  final Widget child;
  const ProvidersWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...getUniversalBlocProviders(), ...getAuthBlocProviders(),...getDashboardBlocProviders()],
      child: child,
    );
  }
}
