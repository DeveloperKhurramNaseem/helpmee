import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class NotificationsSheet extends StatelessWidget {
  const NotificationsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.notificationSettingLabel,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Text(
              AppLocalizations.of(context)!.genericNotificationSettingLabel,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 13,
              ),
            ),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.pushNotificationLabel,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.sendNotificationsMessageLabel,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 12,
              ),
            ),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.inAppNotification,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.sendNotificationsMessageLabel,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 12,
              ),
            ),
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.emailNotification,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.sendEmailMessageLabel,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 12,
              ),
            ),
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AppButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()?.primaryButton,
              child: Text(AppLocalizations.of(context)!.saveButton),
            ),
          ),
        ],
      ),
    );
  }
}
