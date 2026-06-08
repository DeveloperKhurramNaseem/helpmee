import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/contact_info.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'update_contact_event.dart';
part 'update_contact_state.dart';

class UpdateContactBloc extends Bloc<UpdateContactEvent, UpdateContactState> {
  final UserProfileRepo userProfileRepo;
  UpdateContactBloc(this.userProfileRepo) : super(UpdateContactInitialState()) {
    on<UpdateCurrentContactEvent>(_handleUpdateContactEvent);
  }

  FutureOr<void> _handleUpdateContactEvent(UpdateCurrentContactEvent event, Emitter<UpdateContactState> emit) async {
    try{
      emit(UpdateContactLoadingState());
      var result = await userProfileRepo.updateContact(event.contactId,ContactInfo(name: event.name, phoneNumber: event.phoneNumber, whatsappNumber: event.whatsappNumber));
      if(result.$1){
        emit(UpdateContactLoadedState());
      }else{
        emit(UpdateContactErrorState(message: result.$2));
      }
    }catch(e){
      log(e.toString() , name: 'UpdateContactBloc');
      emit(UpdateContactErrorState(message: ErrorConstants.errorMessage));
    }

  }
}
