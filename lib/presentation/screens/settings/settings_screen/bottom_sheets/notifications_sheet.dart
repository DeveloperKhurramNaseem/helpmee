import 'package:flutter/material.dart';
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
                  'Notifications settings',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Text(
              'Here you can decide how you want to be notified by the app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 13,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Push notification',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              'Throws a push message, even if the app is closed',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 12,
              ),
            ),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          ListTile(
            title: Text(
              'In-app notification',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              'Shows notifications in the home menu\'s notification center',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 12,
              ),
            ),
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
          ListTile(
            title: Text(
              'Email notification',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              'Allows to send you emails',
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
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
