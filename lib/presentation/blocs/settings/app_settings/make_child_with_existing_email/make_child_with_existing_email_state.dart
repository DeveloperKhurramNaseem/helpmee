part of 'make_child_with_existing_email_bloc.dart';

@immutable
sealed class MakeChildWithExistingEmailState {}

class MakeChildWithExistingEmailInitialState
    extends MakeChildWithExistingEmailState {}

    class MakeChildWithExistingEmailLoadingState
    extends MakeChildWithExistingEmailState {}


    class MakeChildWithExistingEmailDoneState
    extends MakeChildWithExistingEmailState {
      final String device;
      final int acccountId;
      final String token;
      MakeChildWithExistingEmailDoneState({required this.device , required this.acccountId , required this.token});
    }


    class MakeChildWithExistingEmailErrorState
    extends MakeChildWithExistingEmailState {
      final String message;
      MakeChildWithExistingEmailErrorState(this.message);
    }

