import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/contact_info.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'add_family_contact_event.dart';
part 'add_family_contact_state.dart';

class AddFamilyContactBloc
    extends Bloc<AddFamilyContactEvent, AddFamilyContactState> {
  final UserProfileRepo userProfileRepo;
  AddFamilyContactBloc(this.userProfileRepo)
    : super(AddFamilyContactInitialState()) {
    on<AddNewFamilyContactEvent>(_handleAddNewFamilyContactEvent);
  }

  FutureOr<void> _handleAddNewFamilyContactEvent(AddNewFamilyContactEvent event, Emitter<AddFamilyContactState> emit) async{
    try{
      emit(AddFamilyContactLoadingState());
      var result = await userProfileRepo.addFamilyContact(ContactInfo(name: event.name, phoneNumber: event.phoneNumber, whatsappNumber: event.whatsappNumber));
      if(result.$1){
        emit(AddFamilyContactLoadedState());
      }else{
        emit(AddFamilyContactErrorState(message: result.$2));
      }
      emit(AddFamilyContactLoadedState());
    }catch(e){
      log(e.toString() , name: 'AddFamilyContactBloc');
      emit(AddFamilyContactErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
