import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/get_notifications_settings/get_notifications_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/update_notification_setting/update_notification_setting_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class NotificationsSheet extends StatelessWidget {
  const NotificationsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<GetNotificationsSettingsBloc>();
    final updateNotificationSettingBloc = context
        .read<UpdateNotificationSettingBloc>();
    final localization = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child:
          BlocBuilder<
            GetNotificationsSettingsBloc,
            GetNotificationsSettingsState
          >(
            builder: (context, state) {
              return Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(
                            context,
                          )!.notificationSettingLabel,
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
                      AppLocalizations.of(
                        context,
                      )!.genericNotificationSettingLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppLightThemeColors.secondaryTextColor,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  NotificationListTile(
                    text: localization.pushNotificationLabel,
                    label: localization.sendPushMessageLabel,
                    initialValue:
                        bloc.notificationSetting.isPushNotificationAllowed,
                    onChanged: (value) {
                      bloc.add(UpdatePushNotificationValueEvent(value: value));
                    },
                  ),
                  NotificationListTile(
                    text: localization.inAppNotification,
                    label: localization.sendNotificationsMessageLabel,
                    initialValue:
                        bloc.notificationSetting.inAppNotificationAllowed,
                    onChanged: (value) {
                      bloc.add(UpdateInAppNotificationValueEvent(value: value));
                    },
                  ),
                  NotificationListTile(
                    text: localization.emailNotification,
                    label: localization.sendEmailMessageLabel,
                    initialValue:
                        bloc.notificationSetting.isEmailNotificationAllowed,
                    onChanged: (value) {
                      bloc.add(UpdateEmailNotificationValueEvent(value: value));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      12,
                      0,
                      12,
                      Platform.isAndroid ? 12 : 0,
                    ),
                    child:
                        BlocBuilder<
                          UpdateNotificationSettingBloc,
                          UpdateNotificationSettingState
                        >(
                          builder: (context, state) {
                            return AppButton(
                              onPressed:
                                  state is UpdateNotificationSettingLoadingState
                                  ? null
                                  : () {
                                      updateNotificationSettingBloc.add(
                                        UpdateGeneralNotificationSettingEvent(
                                          bloc.notificationSetting,
                                        ),
                                      );
                                    },
                              gradient: Theme.of(
                                context,
                              ).extension<AppGradients>()?.primaryButton,
                              child:
                                  state is UpdateNotificationSettingLoadingState
                                  ? CupertinoActivityIndicator(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    )
                                  : Text(
                                      AppLocalizations.of(context)!.saveButton,
                                    ),
                            );
                          },
                        ),
                  ),
                ],
              );
            },
          ),
    );
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
