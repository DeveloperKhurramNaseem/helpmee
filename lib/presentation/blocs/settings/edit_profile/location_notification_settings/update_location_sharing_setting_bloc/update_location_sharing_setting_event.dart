part of 'update_location_sharing_setting_bloc.dart';

@immutable
class UpdateLocationSharingSettingEvent {
  final bool locationSharing;

  const UpdateLocationSharingSettingEvent({required this.locationSharing});
}
