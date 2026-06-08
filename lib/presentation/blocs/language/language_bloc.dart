
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/presentation/blocs/language/language_event.dart';
import 'package:help_mee/presentation/blocs/language/language_state.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final StorageService storageService;
  LanguageBloc(super.initialState,this.storageService){    
    
    on<ChangeLanguageEvent>(_handleChnageLanguageEvent);
  }


  FutureOr<void> _handleChnageLanguageEvent(ChangeLanguageEvent event, Emitter emit)async {
    try{
      await storageService.saveLanguage(LocalizationUtil.locales[event.language]!.languageCode);
      emit(LanguageState(LocalizationUtil.locales[event.language]!));
    }catch(_){

    }
  }
}