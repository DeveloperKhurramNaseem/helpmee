import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/entities/pin_data.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:meta/meta.dart';

part 'set_pin_event.dart';
part 'set_pin_state.dart';

class SetPinBloc extends Bloc<SetPinEvent, SetPinState> {
  final UserRepo userRepo;
  SetPinBloc(this.userRepo) : super(SetPinInitialState()) {
    on<SetNewPinEvent>(_handleSetNewPinEvent);
  }

  FutureOr<void> _handleSetNewPinEvent(SetNewPinEvent event, Emitter<SetPinState> emit) async{
    try {
      emit(SetPinLoadingState());
      var result = await userRepo.setNewPin(event.pinData);
      if (result.$1) {
        emit(SetPinDoneState(result.$2));
      } else {
        emit(SetPinErrorState(result.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'SetPinBloc');
      emit(SetPinErrorState('Something went wrong'));
    }
  }
}
