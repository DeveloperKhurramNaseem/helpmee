import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/notification_user_info.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'update_notification_user_event.dart';
part 'update_notification_user_state.dart';

class UpdateNotificationUserBloc
    extends Bloc<UpdateNotificationUserEvent, UpdateNotificationUserState> {
      final UserLocationNotificationRepo userLocationNotificationRepo;
  UpdateNotificationUserBloc(this.userLocationNotificationRepo) : super(UpdateNotificationUserInitialState()) {  
    on<UpdateCurrentNotificationUserEvent>(_handleUpdateNotificationUser);
  }

  FutureOr<void> _handleUpdateNotificationUser(UpdateCurrentNotificationUserEvent event, Emitter<UpdateNotificationUserState> emit) async{
    try{
      emit(UpdateNotificationUserLoadingState());
      var result =  await userLocationNotificationRepo.updateNotificationUser(event.notificationUserId,NotificationUserInfo(name: event.name, email: event.email));
      if(result.$1){
        emit(UpdateNotificationUserLoadedState());
      }else{
        emit(UpdateNotificationUserErrorState(message: result.$2));
      }
    }catch(e){
      log(e.toString() , name: 'UpdateNotificationUserBloc');
      emit(UpdateNotificationUserErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
