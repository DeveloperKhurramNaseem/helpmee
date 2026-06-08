import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/location_notification_model.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'get_location_notification_settings_event.dart';
part 'get_location_notification_settings_state.dart';

class GetLocationNotificationSettingsBloc
    extends
        Bloc<
          GetLocationNotificationSettingsEvent,
          GetLocationNotificationSettingsState
        > {
  final UserLocationNotificationRepo userLocationNotificationRepo;
  bool pushNotificationCurrentValue = false;
  bool inApNotificatiojnCurentValue = false;
  bool emailNotificationCurrentValue = false;
  bool emailHelpMeeNotificationCurrentValue = false;
  GetLocationNotificationSettingsBloc(this.userLocationNotificationRepo)
  
    : super(GetLocationNotificationSettingsInitialState(locationNotificationModel: LocationNotificationModel.empty())) {
    on<GetUserLocationNotificationSettingsEvent>(
      _handleUserLocationAndNotificationSettings,
    );
  }

  FutureOr<void> _handleUserLocationAndNotificationSettings(
    GetUserLocationNotificationSettingsEvent event,
    Emitter<GetLocationNotificationSettingsState> emit,
  ) async {
    try {
      emit(GetLocationNotificationSettingsLoadingState(locationNotificationModel: LocationNotificationModel.empty()));
      var data = await userLocationNotificationRepo
          .getUserLocationNotificationSettings();          
      if (data.$1) {
        var model = data.$3;
        pushNotificationCurrentValue = model.pushNotification;
    inApNotificatiojnCurentValue = model.inAppNotification;
    emailNotificationCurrentValue = model.emailNotification;
    emailHelpMeeNotificationCurrentValue = model.emailHelpMeeNotification;
        emit(GetLocationNotificationSettingsLoadedState(locationNotificationModel :data.$3));
      } else {
        emit(GetLocationNotificationSettingsErrorState(locationNotificationModel: LocationNotificationModel.empty(),message: data.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'GetLocationNotificationSettingsBloc');
      emit(
        GetLocationNotificationSettingsErrorState(
          locationNotificationModel: LocationNotificationModel.empty(),
          message: ErrorConstants.errorMessage,
        ),
      );
    }
  }
}
