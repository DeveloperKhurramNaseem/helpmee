import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/disease_info.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';
import 'package:meta/meta.dart';

part 'add_disease_event.dart';
part 'add_disease_state.dart';

class AddDiseaseBloc extends Bloc<AddDiseaseEvent, AddDiseaseState> {
  final UserProfileRepo userProfileRepo;
  AddDiseaseBloc(this.userProfileRepo) : super(AddDiseaseInitialState()) {
    on<AddNewDiseaseEvent>(_handleAddNewDiseaseEvent);
  }

  FutureOr<void> _handleAddNewDiseaseEvent(
    AddNewDiseaseEvent event,
    Emitter<AddDiseaseState> emit,
  ) async {
    try {
      emit(AddDiseaseLoadingState());
      (bool, String) result;
      if(event.profileType == ProfileType.pet){
        result = await userProfileRepo.addPetDisease(
        DiseaseInfo(
          name: event.diseaseName,
          medications: event.medications,
          details: event.details,
          isCheck: "${event.isCheck}",
        ),
      );       
      } else{
        result = await userProfileRepo.addDisease(
        DiseaseInfo(
          name: event.diseaseName,
          medications: event.medications,
          details: event.details,
          isCheck: "${event.isCheck}",
        ),
      );
      }     
      if (result.$1) {
        emit(AddDiseaseDoneState(isEdit: event.isEdit));
      } else {
        emit(AddDiseaseErrorState(message: result.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'AddDiseaseBloc');
      emit(AddDiseaseErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
