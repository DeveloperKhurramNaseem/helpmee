import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/entities/notification_setting.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:meta/meta.dart';

part 'update_notification_setting_event.dart';
part 'update_notification_setting_state.dart';

class UpdateNotificationSettingBloc
    extends
        Bloc<UpdateNotificationSettingEvent, UpdateNotificationSettingState> {
  final UserRepo userRepo;
  UpdateNotificationSettingBloc(this.userRepo)
    : super(UpdateNotificationSettingInitialState()) {
    on<UpdateGeneralNotificationSettingEvent>(
      _handleUpdateGeneralNotificationSettings,
    );
  }

  FutureOr<void> _handleUpdateGeneralNotificationSettings(
    UpdateGeneralNotificationSettingEvent event,
    Emitter<UpdateNotificationSettingState> emit,
  ) async{
    try {
      emit(UpdateNotificationSettingLoadingState());
      var result = await userRepo.updateNotificationSetting(event.notificationSetting);
      if(result.$1){
        emit(UpdateNotificationSettingDoneState());
      }      else{
        emit(UpdateNotificationSettingErrorState());
      }
    } catch (e) {
      log(e.toString(), name: 'UpdateNotificationsSettingsBloc');
      emit(UpdateNotificationSettingErrorState());
    }
  }
}
