import 'dart:async';
import 'dart:developer' show log;

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/cooperation_partners.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'get_cooperation_partners_event.dart';
part 'get_cooperation_partners_state.dart';

class GetCooperationPartnersBloc extends Bloc<GetCooperationPartnersEvent, GetCooperationPartnersState> {
  final UserRepo userRepo;
  GetCooperationPartnersBloc(this.userRepo) : super(GetCooperationPartnersInitialState()) {
    on<GetAllCooperationPartnersEvent>(_handleGetAllCooperationPartnersEvent);
  }

  FutureOr<void> _handleGetAllCooperationPartnersEvent(GetAllCooperationPartnersEvent event, Emitter<GetCooperationPartnersState> emit) async{
    try{
      emit(GetCooperationPartnersLoadingState());
      var result = await userRepo.getCooperationPartners();
      if(result.$1){
        emit(GetCooperationPartnersDoneState(cooperationPartners: result.$3));
      }else{
        emit(GetCooperationPartnersErrorState(message: result.$2));
      }      
    }catch(e){
      log(e.toString() , name: 'GetCooperationPartnersBloc');
      emit(GetCooperationPartnersErrorState(message: ErrorConstants.errorMessage));
    }

  }
}
