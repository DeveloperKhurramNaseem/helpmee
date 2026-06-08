import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_contact_event.dart';
part 'delete_contact_state.dart';

class DeleteContactBloc extends Bloc<DeleteContactEvent, DeleteContactState> {
  final UserProfileRepo userProfileRepo;
  DeleteContactBloc(this.userProfileRepo) : super(DeleteContactInitialState()) {
    on<DeleteCurrentContact>(_handleDeleteContactEvent);
  }

  FutureOr<void> _handleDeleteContactEvent(DeleteCurrentContact event, Emitter<DeleteContactState> emit) async {
    try{
      emit(DeleteContactLoadingState());
      var result = await userProfileRepo.deleteContact(event.contactId);
      if(result.$1){
        emit(DeleteContactLoadedState());
      }else{
        emit(DeleteContactErrorState(message: result.$2));
      }      
    }catch(e){
      emit(DeleteContactErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
