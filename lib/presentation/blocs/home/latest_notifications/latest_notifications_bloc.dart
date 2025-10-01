import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:meta/meta.dart';

part 'latest_notifications_event.dart';
part 'latest_notifications_state.dart';

class LatestNotificationsBloc
    extends Bloc<LatestNotificationsEvent, LatestNotificationsState> {
      final UserRepo userRepo;
  LatestNotificationsBloc(this.userRepo) : super(LatestNotificationsInitialState()) {
    on<GetLatestNotificationsEvent>(_handleLatestNotificationsEvent);
  }

  FutureOr<void> _handleLatestNotificationsEvent(
    GetLatestNotificationsEvent event,
    Emitter<LatestNotificationsState> emit,
  ) async{
    try{
      emit(LatestNotificationsLoadingState());
      var result = await userRepo.getLatestNotifications();
      if(result.$1){
        emit(LatestNotificationsLoadedState(notifications: result.$2));
      }else{
        emit(LatestNotificationsErrorState(message: 'Something went wrong'));
      }
    }catch(e){
      emit(LatestNotificationsErrorState(message: 'Something went wrong'));
    }
  }
}
