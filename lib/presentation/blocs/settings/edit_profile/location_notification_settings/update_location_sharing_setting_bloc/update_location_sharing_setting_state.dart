part of 'update_location_sharing_setting_bloc.dart';

@immutable
sealed class UpdateLocationSharingSettingState {}

class UpdateLocationSharingSettingInitialState
    extends UpdateLocationSharingSettingState {}

    class UpdateLocationSharingSettingLoadingState
    extends UpdateLocationSharingSettingState {}

    class UpdateLocationSharingSettingDoneState
    extends UpdateLocationSharingSettingState {}


    class UpdateLocationSharingSettingErrorState
    extends UpdateLocationSharingSettingState {
      final String message;

      UpdateLocationSharingSettingErrorState(this.message);
    }
