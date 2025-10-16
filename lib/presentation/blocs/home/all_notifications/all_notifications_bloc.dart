import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'all_notifications_event.dart';
part 'all_notifications_state.dart';

class AllNotificationsBloc
    extends Bloc<AllNotificationsEvent, AllNotificationsState> {
      final UserRepo userRepo;
  AllNotificationsBloc(this.userRepo) : super(AllNotificationsInitialState()) {
    on<GetAllNotificationsEvent>(_handleAllNotificationsEvent);
  }

  FutureOr<void> _handleAllNotificationsEvent(GetAllNotificationsEvent event, Emitter<AllNotificationsState> emit) async{
    try{
      if(event.isLoading){
        emit(AllNotificationsLoadingState());
      }      
      var result = await userRepo.getAllNotifications();
      if(result.$1){
        emit(AllNotificationsLoadedState(recentNotifications: result.$2.recentNotifications , oldNotificationsList: result.$2.oldNotifications));
      }else{
        emit(AllNotificationsErrorState(message: ErrorConstants.errorMessage));
      }
    }catch(e){
      emit(AllNotificationsErrorState(message: ErrorConstants.errorMessage));
    }
  }
}
