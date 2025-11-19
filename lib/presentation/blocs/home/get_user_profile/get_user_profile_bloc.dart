import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'get_user_profile_event.dart';
part 'get_user_profile_state.dart';

class GetUserProfileBloc extends Bloc<GetUserProfileEvent, GetUserProfileState> {
  final UserRepo userRepo;
  GetUserProfileBloc(this.userRepo) : super(GetUserProfileInitial()) {
    on<GetUserProfileEvent>(_handleGetUserProfileEvent);
  }

  FutureOr<void> _handleGetUserProfileEvent(GetUserProfileEvent event, Emitter<GetUserProfileState> emit) async {
    try{
      emit(GetUserProfileLoading());
      var result = await userRepo.getUserProfile();
      if(result.$1){
        emit(GetUserProfileLoaded());
      }else{
        emit(GetUserProfileError(ErrorConstants.errorMessage));
      }
    }catch(e){
      log(e.toString());
      emit(GetUserProfileError(ErrorConstants.errorMessage));
    }
  }
}
