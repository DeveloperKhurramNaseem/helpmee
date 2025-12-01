import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepo authRepo;
  SignupBloc(this.authRepo) : super(SignupInitialState()) {
    on<SignUpUserEvent>(_handleSignupUserEvent);
    on<ShowErrorEvent>(_handleShowErrorEvent);
    on<SignUpWithGoogleEvent>(_handleSignupWithGoogleEvent);
    on<SignUpWithAppleEvent>(_handleSignupWithAppleEvent);
  }

  FutureOr<void> _handleSignupUserEvent(
    SignUpUserEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      emit(SignupLoadingState());
      var result = await authRepo.signUp(event.email, event.password);
      if (result.$1) {
        emit(SignupDoneState(result.$2));
      } else {
        emit(SignupErrorState(result.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'SignupBloc Error');
      emit(SignupErrorState(ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleShowErrorEvent(
    ShowErrorEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(SignupErrorState(event.message));
  }

  FutureOr<void> _handleSignupWithGoogleEvent(
    SignUpWithGoogleEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      emit(SignupLoadingState());
      var result = await authRepo.signInWithGoogle();
      if (result != null) {
        if (result.success) {
          emit(SocialSignUpDoneState(
            message: result.message,
            token: result.data.accessToken.accessToken,
            activatedProducts: result.activatedProducts,
          ));
        } else {
          emit(SignupErrorState(result.message));
        }
      } else {
        emit(SignupErrorState(ErrorConstants.errorMessageGoogleSignIn));
      }
    } catch (e) {
      log(e.toString(), name: 'SignUpBloc Error');
      emit(SignupErrorState(ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleSignupWithAppleEvent(
    SignUpWithAppleEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      emit(SignupLoadingState());
      var result = await authRepo.signInWithApple();
      if (result != null) {
        if (result.success) {
          emit(SocialSignUpDoneState(
            message: result.message,
            token: result.data.accessToken.accessToken,
            activatedProducts: result.activatedProducts,
          ));
        } else {
          emit(SignupErrorState(result.message));
        }
      } else {
        emit(SignupErrorState(ErrorConstants.errorMessageGoogleSignIn));
      }
    } catch (e) {
      log(e.toString(), name: 'SignUpBloc Error');
      emit(SignupErrorState(ErrorConstants.errorMessage));
    }
  }
}
