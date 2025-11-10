import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'update_cooperation_partner_status_event.dart';
part 'update_cooperation_partner_status_state.dart';

class UpdateCooperationPartnerStatusBloc extends Bloc<UpdateCooperationPartnerStatusEvent, UpdateCooperationPartnerStatusState> {
  final UserRepo userRepo;
  UpdateCooperationPartnerStatusBloc(this.userRepo) : super(UpdateCooperationPartnerStatusInitialState()) {
    on<UpdateCurrentCooperationPartnerStatusEvent>(_handleUpdateStatusEvent);
  }

  FutureOr<void> _handleUpdateStatusEvent(UpdateCurrentCooperationPartnerStatusEvent event, Emitter<UpdateCooperationPartnerStatusState> emit) async {
  try{
      emit(UpdateCooperationPartnerStatusLoadingState());
  final result = await userRepo.updateCooperationPartnerStatus(
    event.id,
    event.isActive,
  );
  if (result.$1) {
    emit(UpdateCooperationPartnerStatusLoadedState(result.$2));
  } else {
    emit(UpdateCooperationPartnerStatusErrorState(result.$2));
  }
  }catch(e){
    log(e.toString() , name: 'UpdateCooperationPartnerStatusBloc');
    emit(UpdateCooperationPartnerStatusErrorState(ErrorConstants.errorMessage));
  }
  }
}
