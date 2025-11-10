import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/basic_profile_info.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'update_basic_info_event.dart';
part 'update_basic_info_state.dart';

class UpdateBasicInfoBloc
    extends Bloc<UpdateBasicInfoEvent, UpdateBasicInfoState> {
  final UserProfileRepo userProfileRepo;
  UpdateBasicInfoBloc(this.userProfileRepo)
    : super(UpdateBasicInfoInitialState()) {
    on<UpdateBasicProfileInfoEvent>(_handleUpdateBasicInfoEvent);
    on<UpdateBasicPetProfileInfoEvent>(_handleUpdatePetInfoEvent);
  }

  FutureOr<void> _handleUpdateBasicInfoEvent(
    UpdateBasicProfileInfoEvent event,
    Emitter<UpdateBasicInfoState> emit,
  ) async {
    try {
      emit(UpdateBasicInfoLoadingState());
      var result = await userProfileRepo.updateBasicProfileInfo(
        BasicProfileInfo(
          firstName: event.firstName,
          lastName: event.lastName,
          gender: event.gender,
          height: event.height,
          weight: event.weight,
          bloodGroup: event.bloodGroup,
          profileImage: event.imageFile,
          bio: event.bio,
          insuranceCompany: event.insuranceCompany,
          insuranceId: event.insuranceId,
        ),
      );
      if (result.$1) {
        emit(UpdateBasicInfoLoadedState());
      } else {
        emit(UpdateBasicInfoErrorState(message: result.$2));
      }
    } catch (e) {
      log(e.toString() , name: 'UpdateBasicInfoBloc');
      emit(UpdateBasicInfoErrorState(message: ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleUpdatePetInfoEvent(
    UpdateBasicPetProfileInfoEvent event,
    Emitter<UpdateBasicInfoState> emit,
  ) async {
    try {
      emit(UpdateBasicInfoLoadingState());
      var result = await userProfileRepo.updateBasicPetProfileInfo(
        BasicPetProfileInfo(
          name: event.name,
          race: event.race,
          gender: event.gender,
          character: event.character,
          profileImage: event.imageFile,
          bloodGroup: event.bloodGroup,
          size: event.size,
          weight: event.weight,
          castrated: event.castrated,
          dateOfBirth: event.dateOfBirth,
          insuranceCompany: event.insuranceCompany,
          insuranceId: event.insuranceId,
          chipped: event.chipped,
          chipPosition: event.chipPosition,
          bio: event.bio,
          taxNo: event.taxNo,
          tassoNo: event.tassoNo,
          specialFeature: event.specialFeatures,
        ),
      );
      if (result.$1) {
        emit(UpdateBasicInfoLoadedState());
      } else {
        emit(UpdateBasicInfoErrorState(message: result.$2));
      }
    } catch (e) {
      emit(UpdateBasicInfoErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
