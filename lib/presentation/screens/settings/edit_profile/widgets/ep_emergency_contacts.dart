import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/create_new_contact.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpEmergencyContacts extends StatelessWidget {
  const EpEmergencyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: AppLocalizations.of(context)!.emergencyContacts,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              ContactsTitleRow(selectedIndex: 0),
              ContactTile(onTap: () {}),
              AddContactTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddContactTile extends StatelessWidget {
  const AddContactTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addContactButton,
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return CreateNewContactSheet();
          },
        );
      },
    );
  }
}

class ContactTile extends StatelessWidget {
  final void Function() onTap;
  const ContactTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 0.55),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 5,
              children: [
                Text(
                  'Aleesha (Mum)',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Row(
                  spacing: 2,
                  children: [
                    SvgPicture.asset(AppIcons.phoneIcon),
                    Text(
                      '+923312234678',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 2,
                  children: [
                    SvgPicture.asset(AppIcons.whatsappIcon),
                    Text(
                      '+923312234678',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset(AppIcons.whatsapp),
                SvgPicture.asset(AppIcons.phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactsTitleRow extends StatelessWidget {
  final int selectedIndex;
  const ContactsTitleRow({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 15,
            children: [
              ContactsTitle(
                title: localization.contactsTabTitle,
                isSelected: true,
              ),
              ContactsTitle(title: localization.doctor, isSelected: false),
              ContactsTitle(title: localization.address, isSelected: false),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactsTitle extends StatelessWidget {
  final String title;
  final bool isSelected;
  const ContactsTitle({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 249, 249, 1),
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: Theme.of(context).colorScheme.primary, width: 1)
            : null,
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: isSelected
              ? Theme.of(context).colorScheme.secondary
              : Color.fromRGBO(0, 0, 0, 0.6),
        ),
      ),
    );
  }
}
