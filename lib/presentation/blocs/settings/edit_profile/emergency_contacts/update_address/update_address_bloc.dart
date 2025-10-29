import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/address_info.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'update_address_event.dart';
part 'update_address_state.dart';

class UpdateAddressBloc extends Bloc<UpdateAddressEvent, UpdateAddressState> {
  final UserProfileRepo userProfileRepo;
  UpdateAddressBloc(this.userProfileRepo) : super(UpdateAddressInitialState()) {
    on<UpdateCurrentAddressEvent>(_handleUpdateCurrentAddressEvent);
  }

  FutureOr<void> _handleUpdateCurrentAddressEvent(UpdateCurrentAddressEvent event, Emitter<UpdateAddressState> emit) async{
    try{
      emit(UpdateAddressLoadingState());
      var result = await userProfileRepo.updateAddress(event.addressId, AddressInfo(name: event.name, streetName: event.streetName, houseNumber: event.houseNumber, city: event.city, country: event.country, description: event.description, code: event.code, zip: event.zip),);
      if(result.$1){
        emit(UpdateAddressLoadedState());
      }else{
        emit(UpdateAddressErrorState(message: result.$2));
      } 
    }catch(e){
      log(e.toString() , name: 'UpdateAddressBloc');
      emit(UpdateAddressErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
