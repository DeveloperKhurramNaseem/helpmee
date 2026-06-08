import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'upload_voice_event.dart';
part 'upload_voice_state.dart';

class UploadVoiceBloc extends Bloc<UploadVoiceEvent, UploadVoiceState> {
  final UserProfileRepo userProfileRepo;
  UploadVoiceBloc(this.userProfileRepo) : super(UploadVoiceInitialState()) {
    on<UploadVoiceNoteEvent>(_handleUpdateVoiceEvent);
  }

  FutureOr<void> _handleUpdateVoiceEvent(UploadVoiceNoteEvent event, Emitter<UploadVoiceState> emit) async{
    try{
      emit(UploadVoiceLoadingState());
      var result = await userProfileRepo.uploadVoice(event.file);
      if(result.$1){
        emit(UploadVoiceLoadedState());
      }else{
        emit(UploadVoiceErrorState(message: result.$2));
      }
    }catch(e)
    {
       log(e.toString() , name: 'UploadVoiceBloc');
      emit(UploadVoiceErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
