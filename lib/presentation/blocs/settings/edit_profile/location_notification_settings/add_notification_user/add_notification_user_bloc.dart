import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/requests/notification_user_info.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'add_notification_user_event.dart';
part 'add_notification_user_state.dart';

class AddNotificationUserBloc
    extends Bloc<AddNotificationUserEvent, AddNotificationUserState> {
      final UserLocationNotificationRepo userLocationNotificationRepo;
  AddNotificationUserBloc(this.userLocationNotificationRepo) : super(AddNotificationUserInitialState()) {
    on<AddNewNotificationUserEvent>(_handleAddNewNotificationUserEvent);
  }

  FutureOr<void> _handleAddNewNotificationUserEvent(AddNewNotificationUserEvent event, Emitter<AddNotificationUserState> emit) async {
    try{
      emit(AddNotificationUserLoadingState());
      var result = await userLocationNotificationRepo.addNotificationUser(NotificationUserInfo(name: event.name, email: event.email));
      if(result.$1){
        emit(AddNotificationUserLoadedState());        
      }else{
        emit(AddNotificationUserErrorState(message: result.$2));
      } 
    }catch(e){
      log(e.toString() , name: 'AddNotificationUserBloc');
      emit(AddNotificationUserErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
