import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_disease_event.dart';
part 'delete_disease_state.dart';

class DeleteDiseaseBloc extends Bloc<DeleteDiseaseEvent, DeleteDiseaseState> {
  final UserProfileRepo userProfileRepo;
  DeleteDiseaseBloc(this.userProfileRepo) : super(DeleteDiseaseInitialState()) {
    on<DeleteCurrentDiseaseEvent>(_handleDeletediseaseEvent);
  }

  FutureOr<void> _handleDeletediseaseEvent(DeleteCurrentDiseaseEvent event, Emitter<DeleteDiseaseState> emit) async {
    try{
      emit(DeleteDiseaseLoadingState(index: event.index));
      var result = await userProfileRepo.deleteDisease(event.diseaeId);
      if(result.$1){
        emit(DeleteDiseaseDoneState());
      }else{
        emit(DeleteDiseaseErrorState(message: result.$2));
      }
    }catch(e){
      log(e.toString() , name: 'DeleteDiseaseBloc');
      emit(DeleteDiseaseErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
