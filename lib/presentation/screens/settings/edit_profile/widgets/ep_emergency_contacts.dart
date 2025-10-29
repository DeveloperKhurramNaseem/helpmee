import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_address_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/create_new_contact.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/register_doctor_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpEmergencyContacts extends StatelessWidget {
  final List<Contact> familyContacts;
  final List<Address> addresses;
  final List<Contact> doctorContacts;
  const EpEmergencyContacts({
    super.key,
    required this.familyContacts,
    required this.addresses,
    required this.doctorContacts,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: AppLocalizations.of(context)!.emergencyContacts,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                spacing: 10,
                children: [
                  ContactsTitleRow(
                    selectedIndex: currentIndex,
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  if (currentIndex == 0) ...[
                    for (var contact in familyContacts)
                      ContactTile(onTap: () {}, contact: contact),
                  ],
                  if (currentIndex == 1) ...[
                    for (var contact in doctorContacts)
                      ContactTile(onTap: () {}, contact: contact),
                  ],
                  if (currentIndex == 2) ...[
                    for (var address in addresses)
                      AddressTile(onTap: () {}, address: address),
                  ],

                  if (currentIndex == 0) AddContactTile(),
                  if (currentIndex == 1) AddDoctorTile(),
                  if (currentIndex == 2) AddAddressTile(),
                ],
              );
            },
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

class AddDoctorTile extends StatelessWidget {
  const AddDoctorTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addDoctorButton,
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return RegisterDoctorSheet();
          },
        );
      },
    );
  }
}

class AddAddressTile extends StatelessWidget {
  const AddAddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addAddress,
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return AddAddressSheet();
          },
        );
      },
    );
  }
}

class ContactTile extends StatelessWidget {
  final void Function() onTap;
  final Contact contact;
  const ContactTile({super.key, required this.onTap, required this.contact});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                if (contact.phoneNo.isNotEmpty)
                  Row(
                    spacing: 2,
                    children: [
                      SvgPicture.asset(AppIcons.phoneIcon),
                      Text(
                        contact.phoneNo,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                if (contact.whatsappNo.isNotEmpty)
                  Row(
                    spacing: 2,
                    children: [
                      SvgPicture.asset(AppIcons.whatsappIcon),
                      Text(
                        contact.whatsappNo,
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
                if (contact.whatsappNo.isNotEmpty)
                  SvgPicture.asset(AppIcons.whatsapp),
                if (contact.phoneNo.isNotEmpty)
                  SvgPicture.asset(AppIcons.phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddressTile extends StatelessWidget {
  final void Function() onTap;
  final Address address;
  const AddressTile({super.key, required this.onTap, required this.address});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Row(
                  spacing: 2,
                  children: [
                    Text(
                      '${address.streetName} ${address.houseNumber}\n${address.zip} ${address.city}, ${address.country}',
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
              children: [SvgPicture.asset(AppIcons.locationIcon)],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactsTitleRow extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;
  const ContactsTitleRow({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

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
              GestureDetector(
                onTap: () {
                  onTap(0);
                },
                child: ContactsTitle(
                  title: localization.contactsTabTitle,
                  isSelected: selectedIndex == 0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTap(1);
                },
                child: ContactsTitle(
                  title: localization.doctor,
                  isSelected: selectedIndex == 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTap(2);
                },
                child: ContactsTitle(
                  title: localization.address,
                  isSelected: selectedIndex == 2,
                ),
              ),
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
