import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:intl/intl.dart';

class EpPetCharacteresticsBox extends StatelessWidget {
  const EpPetCharacteresticsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: 'Characterestics',
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              Row(
                children: [
                  Expanded(
                    child: EpHeaderInfoBaseField(
                      label: 'Character',
                      controller: TextEditingController()..text = 'Khuram',
                    ),
                  ),
                ],
              ),
              EpPetGenderAndBloodGroupTile(),
              EpPetSizeAndWeightTile(),
              EpPetCastratedAndBirthdayTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class EpPetGenderAndBloodGroupTile extends StatelessWidget {
  const EpPetGenderAndBloodGroupTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseDropDownStringField(
            items: ['Male', 'Female'],
            label: 'Gender',
            value: 'Male',
            onChanged: (value) {},
            trailing: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Blood Group',

            controller: TextEditingController()..text = 'DEA 1.1',
          ),
        ),
      ],
    );
  }
}

class EpPetSizeAndWeightTile extends StatelessWidget {
  const EpPetSizeAndWeightTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Size (cm)',

            controller: TextEditingController()..text = '175',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Weight (kg)',

            controller: TextEditingController()..text = '200',
          ),
        ),
      ],
    );
  }
}

class EpPetCastratedAndBirthdayTile extends StatelessWidget {
  const EpPetCastratedAndBirthdayTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseDropDownStringField(
            items: ['Yes', 'No'],
            label: 'Castrated',
            value: 'Yes',
            onChanged: (value) {},
            trailing: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Birthday',

            readOnly: true,
            controller: TextEditingController()
              ..text = DateFormat('MMMM dd, yyyy').format(DateTime.now()),
            trailing: GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(Duration(days: 365 * 100)),
                  lastDate: DateTime.now(),
                );
              },
              child: SvgPicture.asset(AppIcons.calender),
            ),
          ),
        ),
      ],
    );
  }
}
