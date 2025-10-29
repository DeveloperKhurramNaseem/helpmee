import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_address_event.dart';
part 'delete_address_state.dart';

class DeleteAddressBloc extends Bloc<DeleteAddressEvent, DeleteAddressState> {
  final UserProfileRepo userProfileRepo;
  DeleteAddressBloc(this.userProfileRepo) : super(DeleteAddressInitialState()) {
    on<DeleteCurrentAddressEvent>(_handleDeleteCurrentAdressEvent);
  }

  FutureOr<void> _handleDeleteCurrentAdressEvent(DeleteCurrentAddressEvent event, Emitter<DeleteAddressState> emit) async{
    try{
      emit(DeleteAddressLoadingState());
      var result = await userProfileRepo.deleteAddress(event.addressId);
      if(result.$1){
        emit(DeleteAddressLoadedState());      
      }else{
        emit(DeleteAddressErrorState(message: result.$2));
      }      
    }catch(e){
      log(e.toString() , name: 'DeleteAddressBloc');
      emit(DeleteAddressErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
