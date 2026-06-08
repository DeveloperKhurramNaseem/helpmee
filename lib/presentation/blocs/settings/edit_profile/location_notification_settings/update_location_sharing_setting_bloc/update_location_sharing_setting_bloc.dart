import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'update_location_sharing_setting_event.dart';
part 'update_location_sharing_setting_state.dart';

class UpdateLocationSharingSettingBloc
    extends
        Bloc<
          UpdateLocationSharingSettingEvent,
          UpdateLocationSharingSettingState
        > {
  final UserRepo userRepo;
  UpdateLocationSharingSettingBloc(this.userRepo)
    : super(UpdateLocationSharingSettingInitialState()) {
    on<UpdateLocationSharingSettingEvent>(
      _handleUpdateLocationSharingSettingEvent,
    );
  }

  FutureOr<void> _handleUpdateLocationSharingSettingEvent(
    UpdateLocationSharingSettingEvent event,
    Emitter<UpdateLocationSharingSettingState> emit,
  ) async {    
    try {
      emit(UpdateLocationSharingSettingLoadingState());
      var result = await userRepo.updateLocationSharingSetting(
        event.locationSharing,
      );
      if(result.$1){
        emit(UpdateLocationSharingSettingDoneState());
      }else{
        emit(UpdateLocationSharingSettingErrorState(result.$2));
      }
    } catch (e) {
      log(e.toString());
      emit(UpdateLocationSharingSettingErrorState(ErrorConstants.errorMessage));
    }
  }
}
