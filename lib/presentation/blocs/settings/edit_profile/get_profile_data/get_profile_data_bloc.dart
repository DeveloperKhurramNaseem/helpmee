import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'get_profile_data_event.dart';
part 'get_profile_data_state.dart';

class GetProfileDataBloc
    extends Bloc<GetProfileDataEvent, GetProfileDataState> {
      final UserProfileRepo userProfileRepo;
  GetProfileDataBloc(this.userProfileRepo) : super(GetProfileDataInitialState()) {
    on<GetUserProfileDataEvent>(_handleGetUserProfileDataEvent);
  }

  FutureOr<void> _handleGetUserProfileDataEvent(GetUserProfileDataEvent event, Emitter<GetProfileDataState> emit) async {
    try{
      if(event.showLoading){
        emit(GetProfileDataLoadingState());
      }      
      var data = await userProfileRepo.getUserProfile(); 
      if(data.$1){
        emit(GetProfileDataLoadedState(data.$3));
      }else{
        emit(GetProfileDataErrorState(data.$2));
      }
    }catch(e){
      log(e.toString() , name: 'GetProfileDataBloc');
      emit(GetProfileDataErrorState(ErrorConstants.errorMessage));
    }
  }
}
