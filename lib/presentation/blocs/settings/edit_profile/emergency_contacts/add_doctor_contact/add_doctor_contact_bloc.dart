import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/contact_info.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'add_doctor_contact_event.dart';
part 'add_doctor_contact_state.dart';

class AddDoctorContactBloc
    extends Bloc<AddDoctorContactEvent, AddDoctorContactState> {
  final UserProfileRepo userProfileRepo;
  AddDoctorContactBloc(this.userProfileRepo)
    : super(AddDoctorContactInitialState()) {
    on<AddNewDoctorEvent>(_handleAddNewDoctorEvent);
  }

  FutureOr<void> _handleAddNewDoctorEvent(
    AddNewDoctorEvent event,
    Emitter<AddDoctorContactState> emit,
  ) async {
    try {
      emit(AddDoctorContactLoadingState());
      var result = await userProfileRepo.addDoctorContact(
        ContactInfo(
          name: event.name,
          phoneNumber: event.phoneNumber,
          whatsappNumber: event.whatsappNumber,
        ),
      );
      if (result.$1) {
        emit(AddDoctorContactLoadedState());
      } else {
        emit(AddDoctorContactErrorState(message: result.$2));
      }
    } catch (e) {
      emit(AddDoctorContactErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
