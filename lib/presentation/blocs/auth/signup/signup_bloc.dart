import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepo authRepo;
  SignupBloc(this.authRepo) : super(SignupInitialState()) {
    on<SignUpUserEvent>(_handleSignupUserEvent);
    on<ShowErrorEvent>(_handleShowErrorEvent);
  }

  FutureOr<void> _handleSignupUserEvent(
    SignUpUserEvent event,
    Emitter<SignupState> emit,
  )  async{
    try{
      emit(SignupLoadingState());
     var result = await authRepo.signUp(event.email, event.password);     
     if(result.$1){
      emit(SignupDoneState(result.$2));
     }else{
      emit(SignupErrorState(result.$2));
     }
    }catch(e){
      log(e.toString() , name: 'SignupBloc Error');
      emit(SignupErrorState('Something went wrong'));
    }
  }

  FutureOr<void> _handleShowErrorEvent(ShowErrorEvent event, Emitter<SignupState> emit) {
    emit(SignupErrorState(event.message));
  }
}
