import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:help_mee/l10n/app_localizations.dart';

class LocalizationUtil {
  static List<LocalizationsDelegate> delegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static Map<String,Locale> locales = {
    english : Locale('en' , 'US'), // English
    german : Locale('de' , 'DE'), // German / Germany
  };

  static const english = 'English';
  static const german = 'German';
}