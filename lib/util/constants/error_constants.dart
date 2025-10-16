import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/util/dependencies/init.dart';

class ErrorConstants {
  static const String _serverErrorEn = 'Server error, please try again';
  static const String _serverErrorDe = 'Server-Fehler, bitte versuche es erneut';

  static String get errorMessage => sl<StorageService>().getLanguage() == 'en' ? _serverErrorEn : _serverErrorDe;
}