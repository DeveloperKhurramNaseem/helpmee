import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'lock_disease_event.dart';
part 'lock_disease_state.dart';

class LockDiseaseBloc extends Bloc<LockDiseaseEvent, LockDiseaseState> {
  final UserProfileRepo userProfileRepo;
  LockDiseaseBloc(this.userProfileRepo) : super(LockDiseaseInitialState()) {
    on<LockCurrentDiseaseEvent>(_handleLockDiseaseEvent);
  }

  FutureOr<void> _handleLockDiseaseEvent(LockCurrentDiseaseEvent event, Emitter<LockDiseaseState> emit) async {
    try{
      emit(LockDiseaseLoadingState(index: event.index));
      var result = await userProfileRepo.lockDisease(event.diseaseId, event.status);
      if(result.$1){
        emit(LockDiseaseDoneState());
      }else{
        emit(LockDiseaseErrorState(message: result.$2));
      }
    }catch(e){
      log(e.toString() , name: 'LockDiseaseBloc');
      emit(LockDiseaseErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
