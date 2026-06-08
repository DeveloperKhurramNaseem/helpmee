import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/feedback_info.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final UserRepo userRepo;
  FeedbackBloc(this.userRepo) : super(FeedbackInitialState()) {
    on<SendFeedbackEvent>(_handleSendFeedbackEvent);
  }

  FutureOr<void> _handleSendFeedbackEvent(
    SendFeedbackEvent event,
    Emitter<FeedbackState> emit,
  ) async {
    try {
      emit(FeedbackLoadingState());
      var result = await userRepo.sendFeedback(
        FeedbackInfo(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          phoneNo: event.phoneNo,
          subject: event.subject,
          message: event.message,
        ),
      );
      if (result.$1) {
        emit(FeedbackDoneState(message: result.$2));
      } else {
        emit(FeedbackErrorState(message: result.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'FeedbackBloc');
      emit(FeedbackErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
