import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepo authRepo;
  SigninBloc(this.authRepo) : super(SigninInitialState()) {
    on<SignInUserEvent>(_handleSignInEvent);
    on<ShowErrorEvent>(_handleShowErrorEvent);
  }

  FutureOr<void> _handleSignInEvent(SignInUserEvent event, Emitter<SigninState> emit) async {
    try{
      emit(SigninLoadingState());
     var result = await authRepo.signIn(event.email, event.password);     
     if(result.$1){
      emit(SigninLoadedState(result.$2));
     }else{
      emit(SigninErrorState(result.$2));
     }
    }catch(e){
      log(e.toString() , name: 'SignInBloc Error');
      emit(SigninErrorState('Something went wrong'));
    }
  }

  FutureOr<void> _handleShowErrorEvent(ShowErrorEvent event, Emitter<SigninState> emit) {
    emit(SigninErrorState(event.message));
  }
}
