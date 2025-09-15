import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/auth/create_account_screen/create_account_screen.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/light_theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize(MediaQuery.of(context).size);
    return MaterialApp(
      title: 'HelpMee',
      theme: LightTheme.data,
      themeMode: ThemeMode.light,
      home: const CreateAccountScreen(),
    );
  }
}
