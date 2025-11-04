import 'dart:async';
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
      emit(UpdateBasicInfoErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
