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
  GetLocationNotificationSettingsBloc(this.userLocationNotificationRepo)
    : super(GetLocationNotificationSettingsInitialState()) {
    on<GetUserLocationNotificationSettingsEvent>(
      _handleUserLocationAndNotificationSettings,
    );
  }

  FutureOr<void> _handleUserLocationAndNotificationSettings(
    GetUserLocationNotificationSettingsEvent event,
    Emitter<GetLocationNotificationSettingsState> emit,
  ) async {
    try {
      emit(GetLocationNotificationSettingsLoadingState());
      var data = await userLocationNotificationRepo
          .getUserLocationNotificationSettings();
      if (data.$1) {
        emit(GetLocationNotificationSettingsLoadedState(data.$3));
      } else {
        emit(GetLocationNotificationSettingsErrorState(message: data.$2));
      }
    } catch (e) {
      log(e.toString(), name: 'GetLocationNotificationSettingsBloc');
      emit(
        GetLocationNotificationSettingsErrorState(
          message: ErrorConstants.errorMessage,
        ),
      );
    }
  }
}
