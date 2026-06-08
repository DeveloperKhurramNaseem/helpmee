import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_voice_event.dart';
part 'delete_voice_state.dart';

class DeleteVoiceBloc extends Bloc<DeleteVoiceEvent, DeleteVoiceState> {
  final UserRepo userRepo;
  DeleteVoiceBloc(this.userRepo) : super(DeleteVoiceInitialState()) {
    on<DeleteVoiceEvent>(_handleDeleteVoiceEvent);
  }

  FutureOr<void> _handleDeleteVoiceEvent(DeleteVoiceEvent event, Emitter<DeleteVoiceState> emit) async{
    try{
      emit(DeleteVoiceLoadingState());
      var result = await userRepo.deleteVoice();
      if(result.$1){
        emit(DeleteVoiceDoneState());
      }else{
        emit(DeleteVoiceErrorState(result.$2));
      }
    }catch(e){
      log(e.toString());
      emit(DeleteVoiceErrorState(ErrorConstants.errorMessage));
    }
  }
}
