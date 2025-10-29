import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/address_info.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final UserProfileRepo userProfileRepo;
  AddAddressBloc(this.userProfileRepo) : super(AddAddressInitialState()) {
    on<AddNewAddressEvent>(_handleAddNewAddressEvent);
  }

  FutureOr<void> _handleAddNewAddressEvent(
    AddNewAddressEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    try {
      emit(AddAddressLoadingState());
      var result = await userProfileRepo.addAddress(
        AddressInfo(
          name: event.name,
          streetName: event.streetName,
          houseNumber: event.houseNumber,
          city: event.city,
          country: event.country,
          description: event.description,
          code: event.code,
          zip: event.zip,
        ),
      );
      if (result.$1) {
        emit(AddAddressLoadedState());
      } else {
        emit(AddAddressErrorState(message: result.$2));
      }
    } catch (e) {
      log(e.toString() , name: 'AddAddressBloc');
      emit(AddAddressErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
