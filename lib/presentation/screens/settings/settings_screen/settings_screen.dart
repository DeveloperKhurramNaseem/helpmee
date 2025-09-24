import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/bottom_sheets/notifications_sheet.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_base_tile.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_header.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_text.dart';
import 'package:help_mee/util/constants/icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(),
      body: CustomScrollView(
        slivers: [
          SettingsHeader(),
          SettingsDivider(),
          SettingsCategoryText(category: 'Products & services'),
          SettingsBaseTile(
            titleText: 'Products & Profiles',
            image: AppIcons.plusSettings,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Buy HelpMee products',
            image: AppIcons.sos,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Feedback',
            image: AppIcons.feedback,
            onTap: () {},
          ),
          SettingsCategoryText(category: 'Account settings'),
          SettingsBaseTile(
            titleText: 'Add / switch profile',
            image: AppIcons.switchIcon,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Notifications',
            image: AppIcons.lock,
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                  isScrollControlled: true,
                builder: (context) {
                  return NotificationsSheet();
                },
              );
            },
          ),
          SettingsBaseTile(
            titleText: 'Change password',
            image: AppIcons.lock,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Language',
            image: AppIcons.language,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Profile validity',
            image: AppIcons.profileValidity,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Delete profile',
            image: AppIcons.delete,
            onTap: () {},
          ),
          SettingsCategoryText(category: 'Legal'),
          SettingsBaseTile(
            titleText: 'Privacy policy',
            image: AppIcons.privacyIcon,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Terms & Conditions',
            image: AppIcons.privacyIcon,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'End User License Agreement',
            image: AppIcons.privacyIcon,
            onTap: () {},
          ),
          SettingsDivider(),
          SettingsBaseTile(
            titleText: 'Sign out',
            image: AppIcons.signOutIcon,
            onTap: () {},
          ),

          SettingsVersionText(version: 'Version 3.5.0'),
        ],
      ),
    );
  }
}
