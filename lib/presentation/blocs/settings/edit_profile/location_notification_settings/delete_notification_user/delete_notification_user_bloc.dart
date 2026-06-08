import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'delete_notification_user_event.dart';
part 'delete_notification_user_state.dart';

class DeleteNotificationUserBloc
    extends Bloc<DeleteNotificationUserEvent, DeleteNotificationUserState> {
      final UserLocationNotificationRepo userLocationNotificationRepo;
  DeleteNotificationUserBloc(this.userLocationNotificationRepo) : super(DeleteNotificationUserInitialState()) {
    on<DeleteCurrentNotificationUserEvent>(_handleDeleteCurrentNotificationUser);
  }

  FutureOr<void> _handleDeleteCurrentNotificationUser(DeleteCurrentNotificationUserEvent event, Emitter<DeleteNotificationUserState> emit) async {
    try{
      emit(DeleteNotificationUserLoadingState(id: event.notificationUserId));
      var result = await userLocationNotificationRepo.deleteNotificationUser(event.notificationUserId);
      if(result.$1){
        emit(DeleteNotificationUserLoadedState());
      }else{
        emit(DeleteNotificationUserErrorState(message: result.$2));
      }
    }catch(e){
      emit(DeleteNotificationUserErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
