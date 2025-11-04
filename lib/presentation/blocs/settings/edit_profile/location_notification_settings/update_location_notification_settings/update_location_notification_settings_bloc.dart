import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_mee/data/models/location_notification_model.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:meta/meta.dart';

part 'update_location_notification_settings_event.dart';
part 'update_location_notification_settings_state.dart';

class UpdateLocationAndNotificationSettingsBloc
    extends
        Bloc<
          UpdateLocationAndNotificationSettingsEvent,
          UpdateLocationAndNotificationSettingsState
        > {
  final UserLocationNotificationRepo userLocationNotificationRepo;
  UpdateLocationAndNotificationSettingsBloc(this.userLocationNotificationRepo)
    : super(UpdateLocationAndNotificationSettingsInitialState()) {
    on<UpdateCurrentLocationNotificationSettingsEvent>(
      _handleUpdateCurrentLocationNotificationSettingsEvent,
    );
  }

  FutureOr<void> _handleUpdateCurrentLocationNotificationSettingsEvent(
    UpdateCurrentLocationNotificationSettingsEvent event,
    Emitter<UpdateLocationAndNotificationSettingsState> emit,
  ) async {
    try {
      emit(UpdateLocationAndNotificationSettingsLoadingState());
      var result = await userLocationNotificationRepo
          .updateLocationNotificationSettings(
            LocationNotificationModel(
              pushNotification: event.pushNotification,
              emailNotification: event.emailNotification,
              inAppNotification: event.inAppNotification,
              emailHelpMeeNotification: event.emailHelpMeeNotification,
            ),
          );
      if (result.$1) {
        emit(UpdateLocationAndNotificationSettingsLoadedState());
      } else {
        emit(
          UpdateLocationAndNotificationSettingsErrorState(message: result.$2),
        );
      }
    } catch (e) {
      emit(
        UpdateLocationAndNotificationSettingsErrorState(
          message: ErrorConstants.errorMessage,
        ),
      );
    }
  }
}
