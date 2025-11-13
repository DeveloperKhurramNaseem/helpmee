import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/demo_profile_model.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'get_demo_profiles_event.dart';
part 'get_demo_profiles_state.dart';

class GetDemoProfilesBloc
    extends Bloc<GetDemoProfilesEvent, GetDemoProfilesState> {
  final UserRepo userRepo;
  List<DemoProfileModel> demoProfiles = [];
  GetDemoProfilesBloc(this.userRepo) : super(GetDemoProfilesInitialState()) {
    on<GetDemoProfilesEvent>(_handleGETDemoProfilesEvent);
  }

  FutureOr<void> _handleGETDemoProfilesEvent(GetDemoProfilesEvent event, Emitter<GetDemoProfilesState> emit) async {
    try{
      emit(GetDemoProfilesLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      // var result = await userRepo.getDemoProfiles();
      // if(result.$1){
        // demoProfiles = result.$3;
        emit(GetDemoProfilesLoadedState(demoProfiles: [
          for(var i = 0 ; i < 3 ; i++)
          DemoProfileModel(userName: 'Emergency: Profile girl'),
        ]));
      // }else{
      //   emit(GetDemoProfilesErrorState(message:result.$2));
      // }
    }catch(e){
      log(e.toString());
      emit(GetDemoProfilesErrorState(message:ErrorConstants.errorMessage));
    }
  }
}
