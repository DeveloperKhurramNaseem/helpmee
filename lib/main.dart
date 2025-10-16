import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_state.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';
import 'package:help_mee/util/providers/bloc_providers.dart';
import 'package:help_mee/util/routing/router_config.dart';
import 'package:help_mee/util/theme/light_theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  log(await sl<TokenService>().getToken());
  runApp(ProvidersWrapper(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize(MediaQuery.of(context).size);
    return BlocListener<LanguageBloc, LanguageState>(
      listener: _listenToLanguageChangeEvents,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return Builder(
            builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.linear(0.9)),
                child: MaterialApp.router(
                  title: 'HelpMee',
                  theme: LightTheme.data,
                  themeMode: ThemeMode.light,
                  localizationsDelegates: LocalizationUtil.delegates,
                  supportedLocales: LocalizationUtil.locales.values,
                  locale: state.locale,
                  routerConfig: Routing.routerConfig,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _listenToLanguageChangeEvents(BuildContext context, LanguageState state) {
    context.read<LatestNotificationsBloc>().add(GetLatestNotificationsEvent(isLoading: false));
      context.read<AllNotificationsBloc>().add(GetAllNotificationsEvent(isLoading: false));
  }
}

class ProvidersWrapper extends StatelessWidget {
  final Widget child;
  const ProvidersWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...getUniversalBlocProviders(),
        ...getAuthBlocProviders(),
        ...getDashboardBlocProviders(),
        ...getActivateProductBlocProviders(),
        ...getSettingsBlocProviders(),
      ],
      child: child,
    );
  }
}
