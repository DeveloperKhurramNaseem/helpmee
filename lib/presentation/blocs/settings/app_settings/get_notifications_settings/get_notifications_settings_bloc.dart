import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/entities/notification_setting.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:meta/meta.dart';

part 'get_notifications_settings_event.dart';
part 'get_notifications_settings_state.dart';

class GetNotificationsSettingsBloc
    extends Bloc<GetNotificationsSettingsEvent, GetNotificationsSettingsState> {
  final UserRepo userRepo;
  NotificationSetting notificationSetting = NotificationSetting.empty();
  GetNotificationsSettingsBloc(this.userRepo)
    : super(GetNotificationsSettingsInitialState()) {
    on<GetGeneralNotificationSettingsEvent>(
      _handleGeneralNotificationSettingsEvent,
    );   
    on<UpdatePushNotificationValueEvent>(_handleUpdatePushNotificationValueEvent);
    on<UpdateInAppNotificationValueEvent>(_handleUpdateInAppNotificationValueEvent);
    on<UpdateEmailNotificationValueEvent>(_handleUpdateEmailNotificationValueEvent);
  }

  FutureOr<void> _handleGeneralNotificationSettingsEvent(
    GetGeneralNotificationSettingsEvent event,
    Emitter<GetNotificationsSettingsState> emit,
  ) async {
    try {
      var notificationSettings = await userRepo.getNotificationSetting();
      if (notificationSettings.$1) {
        notificationSetting = notificationSettings.$2;       
      }
       emit(GetNotificationsSettingsUpdateState());
    } catch (e) {
      log(e.toString(), name: 'GetNotificationsSettingsBloc');
       emit(GetNotificationsSettingsUpdateState());
    }
  }



  FutureOr<void> _handleUpdatePushNotificationValueEvent(UpdatePushNotificationValueEvent event, Emitter<GetNotificationsSettingsState> emit) {
    notificationSetting.isPushNotificationAllowed = event.value;
    emit(GetNotificationsSettingsUpdateState());
  }

  FutureOr<void> _handleUpdateInAppNotificationValueEvent(UpdateInAppNotificationValueEvent event, Emitter<GetNotificationsSettingsState> emit) {
    notificationSetting.inAppNotificationAllowed = event.value;
    emit(GetNotificationsSettingsUpdateState());
  }

  FutureOr<void> _handleUpdateEmailNotificationValueEvent(UpdateEmailNotificationValueEvent event, Emitter<GetNotificationsSettingsState> emit) {
    notificationSetting.isEmailNotificationAllowed = event.value;
    emit(GetNotificationsSettingsUpdateState());
  }
}
