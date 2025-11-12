import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/notification_user_model.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'get_notification_user_event.dart';
part 'get_notification_user_state.dart';

class GetNotificationUserBloc
    extends Bloc<GetNotificationUserEvent, GetNotificationUserState> {
  final UserLocationNotificationRepo userRepo;
  GetNotificationUserBloc(this.userRepo)
    : super(GetNotificationUserInitialState()) {
    on<GetAllNotificationUsersEvent>(_handleAllNotificationUserEVent);
  }

  FutureOr<void> _handleAllNotificationUserEVent(
    GetAllNotificationUsersEvent event,
    Emitter<GetNotificationUserState> emit,
  ) async {
    try {
      emit(GetNotificationUserLoadingState());
      var result = await userRepo.getNotificationUsers();
      if (result.$1) {
        emit(GetNotificationUserDoneState(notificationUserList: result.$3));
      } else {
        emit(GetNotificationUserErrorState(message: result.$2));
      }
    } catch (e) {
      emit(GetNotificationUserErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
