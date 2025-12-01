import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'make_child_with_existing_email_event.dart';
part 'make_child_with_existing_email_state.dart';

class MakeChildWithExistingEmailBloc
    extends
        Bloc<MakeChildWithExistingEmailEvent, MakeChildWithExistingEmailState> {
          final UserRepo userRepo;
  MakeChildWithExistingEmailBloc(this.userRepo)
    : super(MakeChildWithExistingEmailInitialState()) {
    on<MakeChildWithExistingEmailEvent>(_handleMakeChildWithExistingEmailEvent);
  }

  FutureOr<void> _handleMakeChildWithExistingEmailEvent(MakeChildWithExistingEmailEvent event, Emitter<MakeChildWithExistingEmailState> emit) async{
    try{
      emit(MakeChildWithExistingEmailLoadingState());
      var result = await userRepo.makeChildWithExistingEmail(event.code);
      if(result.success){
        emit(MakeChildWithExistingEmailDoneState(device: event.device , acccountId: result.user.id ?? 0, token: result.data.accessToken.accessToken));
      }else{
        emit(MakeChildWithExistingEmailErrorState(result.message));
      }
    }catch(e){
      log(e.toString());
      emit(MakeChildWithExistingEmailErrorState(ErrorConstants.errorMessage));
    }
  }
}
