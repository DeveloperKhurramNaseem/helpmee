import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/auth_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepo authRepo;
  SigninBloc(this.authRepo) : super(SigninInitialState()) {
    on<SignInUserEvent>(_handleSignInEvent);
    on<ShowErrorEvent>(_handleShowErrorEvent);
    on<SignInWithGoogleEvent>(_handleGoogleSignInEvent);
    on<SignInWithAppleEvent>(_handleAppleSignInEvent);
  }

  FutureOr<void> _handleSignInEvent(
    SignInUserEvent event,
    Emitter<SigninState> emit,
  ) async {
    try {
      emit(SigninLoadingState());
      var result = await authRepo.signIn(event.email, event.password);
      if (result.success) {
        emit(
          SigninLoadedState(
            message: result.message,
            activatedProducts: result.activatedProducts,
            token: result.data.accessToken.accessToken,
          ),
        );
      } else {
        emit(SigninErrorState(result.message));
      }
    } catch (e) {
      log(e.toString(), name: 'SignInBloc Error');
      emit(SigninErrorState(ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleShowErrorEvent(
    ShowErrorEvent event,
    Emitter<SigninState> emit,
  ) {
    emit(SigninErrorState(event.message));
  }

  FutureOr<void> _handleGoogleSignInEvent(
    SignInWithGoogleEvent event,
    Emitter<SigninState> emit,
  ) async {
    try {
      emit(SigninLoadingState());
      var result = await authRepo.signInWithGoogle();
      if (result != null) {
        if (result.success) {
          emit(
            SigninLoadedState(
              message: result.message,
              activatedProducts: result.activatedProducts,
              token: result.data.accessToken.accessToken,
            ),
          );
        } else {
          emit(SigninErrorState(result.message));
        }
      } else {
        emit(SigninErrorState(ErrorConstants.errorMessageGoogleSignIn));
      }
    } catch (e) {
      log(e.toString(), name: 'SignInBloc Error');
      emit(SigninErrorState(ErrorConstants.errorMessage));
    }
  }

  FutureOr<void> _handleAppleSignInEvent(
    SignInWithAppleEvent event,
    Emitter<SigninState> emit,
  ) async {
    try {
      emit(SigninLoadingState());
      var result = await authRepo.signInWithApple();
      if (result != null) {
        if (result.success) {
          emit(
            SigninLoadedState(
              message: result.message,
              activatedProducts: result.activatedProducts,
              token: result.data.accessToken.accessToken,
            ),
          );
        } else {
          emit(SigninErrorState(result.message));
        }
      } else {
        emit(SigninErrorState(ErrorConstants.errorMessageAppleSignIn));
      }
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        emit(SigninInitialState()); // user canceled → silent exit
      } else {
        emit(SigninErrorState(ErrorConstants.errorMessage));
      }
    } catch (e) {
      log(e.runtimeType.toString(), name: 'SignInBloc Error');
      emit(SigninErrorState(ErrorConstants.errorMessage));
    }
  }
}
