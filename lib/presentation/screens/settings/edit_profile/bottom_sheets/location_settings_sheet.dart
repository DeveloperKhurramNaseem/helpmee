import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_new_person_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart' show AppLightThemeColors;

class LocationSettingsBottomSheet extends StatelessWidget {
  const LocationSettingsBottomSheet({super.key});

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
                  'Location settings',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Text(
              'Here you can decide how you want to be notified when a first aider sends their location to you.',
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
                        '[email address]@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppLightThemeColors.secondaryTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    NotificationListTile(
                      initialValue: true,
                      text: 'Push notification',
                      label:
                          'Throws a push message, even if the app is closed.',
                      onChanged: (value) {},
                    ),
                    NotificationListTile(
                      initialValue: false,
                      text: 'In-app notification',
                      label:
                          'Shows notification in the home menu\'s notification center',
                      onChanged: (value) {},
                    ),
                    NotificationListTile(
                      initialValue: false,
                      text: 'Email notification',
                      label: 'Sends you an email',
                      onChanged: (value) {},
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
                      initialValue: false,
                      text: 'Email notification',
                      label: 'Sends an email to addresses below',
                      onChanged: (value) {},
                    ),
                    LocationSettingEmailTile(
                      title: 'Uncle Sam',
                      details: 'naseemkhurram397@gmail.com',
                      onTap: () {},
                    ),
                    LocationSettingEmailTile(
                      title: 'Grandmother',
                      details: 'naseemkhurram397@gmail.com',
                      onTap: () {},
                    ),
                    LocationSettingsAddPersonTile(),
                  ],
                ),
              ),
            ),
          ),
        ],
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
