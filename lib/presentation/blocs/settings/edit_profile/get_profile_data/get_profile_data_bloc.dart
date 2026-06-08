import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';
import 'package:meta/meta.dart';

part 'get_profile_data_event.dart';
part 'get_profile_data_state.dart';

class GetProfileDataBloc
    extends Bloc<GetProfileDataEvent, GetProfileDataState> {
      final UserProfileRepo userProfileRepo;
      UserProfileModel? userProfileModel;
      ProfileType profileType = ProfileType.personal;
  GetProfileDataBloc(this.userProfileRepo) : super(GetProfileDataInitialState()) {
    on<GetUserProfileDataEvent>(_handleGetUserProfileDataEvent);
    on<GetUserProfileDataSetProfileType>(_handleSetProfileType);
  }

  FutureOr<void> _handleGetUserProfileDataEvent(GetUserProfileDataEvent event, Emitter<GetProfileDataState> emit) async {
    try{
      if(event.showLoading){
        emit(GetProfileDataLoadingState());
      }      
      (bool, String, UserProfileModel) data;
      if(profileType == ProfileType.pet){
        data = await userProfileRepo.getPetUserProfile();                  
      }else{
        data = await userProfileRepo.getUserProfile();        
      }            
      if(data.$1){
        userProfileModel = data.$3;        
        emit(GetProfileDataLoadedState(data.$3));
      }else{
        emit(GetProfileDataErrorState(data.$2));
      }
    }catch(e){
      log(e.toString() , name: 'GetProfileDataBloc');
      emit(GetProfileDataErrorState(ErrorConstants.errorMessage));
    }
  }

  /// Used when the user changes the current profile type.
  FutureOr<void> _handleSetProfileType(GetUserProfileDataSetProfileType event, Emitter<GetProfileDataState> emit) {
    profileType = event.profileType;
  }
}
