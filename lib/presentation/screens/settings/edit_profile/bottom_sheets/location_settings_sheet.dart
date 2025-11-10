import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/data/models/location_notification_model.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/location_notification_settings/get_location_notification_settings/get_location_notification_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/location_notification_settings/update_location_notification_settings/update_location_notification_settings_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_new_person_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/theme/app_colors.dart' show AppLightThemeColors;
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class LocationSettingsBottomSheet extends StatefulWidget {
  const LocationSettingsBottomSheet({super.key});

  @override
  State<LocationSettingsBottomSheet> createState() =>
      _LocationSettingsBottomSheetState();
}

class _LocationSettingsBottomSheetState
    extends State<LocationSettingsBottomSheet> {
  bool enabled = false;

  updateEnable(LocationNotificationModel model) {
    var bloc = context.read<GetLocationNotificationSettingsBloc>();
    enabled =
        bloc.pushNotificationCurrentValue != model.pushNotification ||
        bloc.inApNotificatiojnCurentValue != model.inAppNotification ||
        bloc.emailNotificationCurrentValue != model.emailNotification ||
        bloc.emailHelpMeeNotificationCurrentValue !=
            model.emailHelpMeeNotification;
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var bloc = context.read<GetLocationNotificationSettingsBloc>();
    return BlocListener<
      UpdateLocationAndNotificationSettingsBloc,
      UpdateLocationAndNotificationSettingsState
    >(
      listener: _handleUpdateLocationStateListener,
      child: BlocBuilder<GetLocationNotificationSettingsBloc, GetLocationNotificationSettingsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          localization.locationSetting,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                    child: Text(
                      localization.locationSettingSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppLightThemeColors.secondaryTextColor,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Notification to yourself',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
                              child: Text(
                                sl<StorageService>().getUser().email ?? '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppLightThemeColors.secondaryTextColor,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            NotificationListTile(
                              initialValue: bloc.pushNotificationCurrentValue,
                              text: localization.pushNotificationLabel,
                              label: localization.sendPushMessageLabel,
                              onChanged: (value) {
                                setState(() {
                                  bloc.pushNotificationCurrentValue = value;
                                  updateEnable(state.locationNotificationModel);
                                });
                              },
                            ),
                            NotificationListTile(
                              initialValue: bloc.inApNotificatiojnCurentValue,
                              text: localization.inAppNotification,
                              label: localization.sendNotificationsMessageLabel,
                              onChanged: (value) {
                                setState(() {
                                  bloc.inApNotificatiojnCurentValue = value;
                                  updateEnable(state.locationNotificationModel);
                                });
                              },
                            ),
                            NotificationListTile(
                              initialValue: bloc.emailNotificationCurrentValue,
                              text: localization.emailNotification,
                              label: localization.sendsEmail,
                              onChanged: (value) {
                                setState(() {
                                  bloc.emailNotificationCurrentValue = value;
                                  updateEnable(state.locationNotificationModel);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Notification to persons',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            NotificationListTile(
                              initialValue:
                                  bloc.emailHelpMeeNotificationCurrentValue,
                              text: localization.emailNotification,
                              label: 'Sends an email to addresses below',
                              onChanged: (value) {
                                setState(() {
                                  bloc.emailHelpMeeNotificationCurrentValue =
                                      value;
                                  updateEnable(state.locationNotificationModel);
                                });
                              },
                            ),
                            // LocationSettingEmailTile(
                            //   title: 'Uncle Sam',
                            //   details: 'naseemkhurram397@gmail.com',
                            //   onTap: () {},
                            // ),
                            // LocationSettingEmailTile(
                            //   title: 'Grandmother',
                            //   details: 'naseemkhurram397@gmail.com',
                            //   onTap: () {},
                            // ),
                            // LocationSettingEmailTile(
                            //   title: 'Uncle Sam',
                            //   details: 'naseemkhurram397@gmail.com',
                            //   onTap: () {},
                            // ),
                            // LocationSettingEmailTile(
                            //   title: 'Grandmother',
                            //   details: 'naseemkhurram397@gmail.com',
                            //   onTap: () {},
                            // ),
                            LocationSettingsAddPersonTile(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child:
                        BlocBuilder<
                          UpdateLocationAndNotificationSettingsBloc,
                          UpdateLocationAndNotificationSettingsState
                        >(
                          builder: (context, state) {
                            return Opacity(
                              opacity: enabled ? 1 : 0.7,
                              child: AppButton(
                                onPressed:
                                    state
                                        is UpdateLocationAndNotificationSettingsLoadingState
                                    ? null
                                    : enabled
                                    ? () {
                                        context
                                            .read<
                                              UpdateLocationAndNotificationSettingsBloc
                                            >()
                                            .add(
                                              UpdateCurrentLocationNotificationSettingsEvent(
                                                pushNotification: bloc
                                                    .pushNotificationCurrentValue,
                                                emailNotification: bloc
                                                    .emailNotificationCurrentValue,
                                                inAppNotification: bloc
                                                    .inApNotificatiojnCurentValue,
                                                emailHelpMeeNotification: bloc
                                                    .emailHelpMeeNotificationCurrentValue,
                                              ),
                                            );
                                      }
                                    : null,
                                gradient: Theme.of(
                                  context,
                                ).extension<AppGradients>()!.primaryButton,
                                child:
                                    state
                                        is UpdateLocationAndNotificationSettingsLoadingState
                                    ? CupertinoActivityIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        AppLocalizations.of(
                                          context,
                                        )!.saveButton,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleUpdateLocationStateListener(
    BuildContext context,
    UpdateLocationAndNotificationSettingsState state,
  ) {
    if (state is UpdateLocationAndNotificationSettingsLoadedState) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

class NotificationListTile extends StatelessWidget {
  final String text;
  final String label;
  final bool initialValue;

  final ValueChanged<bool> onChanged;
  const NotificationListTile({
    super.key,
    required this.text,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(
        label,
        style: TextStyle(
          color: AppLightThemeColors.secondaryTextColor,
          fontSize: 12,
        ),
      ),
      trailing: Switch(value: initialValue, onChanged: onChanged),
    );
  }
}

class LocationSettingsAddPersonTile extends StatelessWidget {
  const LocationSettingsAddPersonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: EpBaseAddTile(
        title: 'Add person',
        onTap: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            builder: (context) {
              return AddNewPersonSheet();
            },
          );
        },
      ),
    );
  }
}

class LocationSettingEmailTile extends StatelessWidget {
  final String title;
  final String details;
  final void Function() onTap;
  const LocationSettingEmailTile({
    super.key,
    required this.title,
    required this.details,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: AppSize.instance.height * 0.065,
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 249, 249, 0.55),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(237, 237, 237, 1),
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        details,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  SvgPicture.asset(AppIcons.edit),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(AppIcons.del),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
