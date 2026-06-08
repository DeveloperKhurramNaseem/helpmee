import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/date_picker_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/constants/date_formatting.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpPetCharacteresticsBox extends StatelessWidget {
  final TextEditingController characterController,
      bloodGroupController,
      sizeController,
      weightController,
      birthdayController;
  final void Function(int? value) onGenderChanged;
  final int genderValue;
  final void Function(String? status) onCastratedChanged;
  final String castratedValue;
  final void Function(DateTime date) onBirthdayChanged;
  final DateTime initialBirthdayDate;

  const EpPetCharacteresticsBox({
    super.key,
    required this.genderValue,
    required this.characterController,
    required this.bloodGroupController,
    required this.sizeController,
    required this.birthdayController,
    required this.weightController,
    required this.onGenderChanged,
    required this.castratedValue,
    required this.onCastratedChanged,
    required this.onBirthdayChanged,
    required this.initialBirthdayDate,
  });

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
                      controller: characterController,
                    ),
                  ),
                ],
              ),
              EpPetGenderAndBloodGroupTile(
                initialValue: genderValue,
                onGenderChanged: onGenderChanged,
                bloodGroupController: bloodGroupController,
              ),
              EpPetSizeAndWeightTile(
                sizeController: sizeController,
                weightController: weightController,
              ),
              EpPetCastratedAndBirthdayTile(
                initialBirthdayDate: initialBirthdayDate,
                onCastratedChanged: onCastratedChanged,
                birthdayController: birthdayController,
                onBirthdayChanged: onBirthdayChanged,
                castratedValue: castratedValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EpPetGenderAndBloodGroupTile extends StatelessWidget {
  final void Function(int? value) onGenderChanged;
  final int initialValue;
  final TextEditingController bloodGroupController;
  const EpPetGenderAndBloodGroupTile({
    super.key,
    required this.initialValue,
    required this.onGenderChanged,
    required this.bloodGroupController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseDropDownField(
            genderValue: initialValue,
            items: TextFieldsConstants.genderValues,
            label: AppLocalizations.of(context)!.genderLabel,
            onChanged: onGenderChanged,
            trailing: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: AppLocalizations.of(context)!.bloodGroup,

            controller: bloodGroupController,
          ),
        ),
      ],
    );
  }
}

class EpPetSizeAndWeightTile extends StatelessWidget {
  final TextEditingController sizeController, weightController;
  const EpPetSizeAndWeightTile({
    super.key,
    required this.sizeController,
    required this.weightController,
  });

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Size (cm)',
            keyBoardType: TextInputType.number,
            controller: sizeController,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: localization.weightKg,
            keyBoardType: TextInputType.number,
            controller: weightController,
          ),
        ),
      ],
    );
  }
}

class EpPetCastratedAndBirthdayTile extends StatelessWidget {
  final void Function(String? status) onCastratedChanged;
  final String castratedValue;
  final TextEditingController birthdayController;
  final void Function(DateTime date) onBirthdayChanged;
  final DateTime initialBirthdayDate;
  const EpPetCastratedAndBirthdayTile({
    super.key,
    required this.castratedValue,
    required this.onCastratedChanged,
    required this.birthdayController,
    required this.onBirthdayChanged,
    required this.initialBirthdayDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseDropDownStringField(
            items: TextFieldsConstants.castratedValues,
            label: 'Castrated',
            value: castratedValue,
            onChanged: onCastratedChanged,
            trailing: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: AppLocalizations.of(context)!.birthday,
            readOnly: true,
            controller: birthdayController,
            trailing: GestureDetector(
              onTap: () {
                if (Platform.isIOS) {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    showDragHandle: true,
                    builder: (context) {
                      return DatePickerSheet(
                        initialDate: initialBirthdayDate,
                        onDateTimeSelect: (value) {
                          onBirthdayChanged(value);
                          birthdayController.text =
                              DateFormatting.formatDateForTextField(value);
                        },
                      );
                    },
                  );
                } else {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(
                      Duration(days: 365 * 100),
                    ),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      onBirthdayChanged(value);
                      birthdayController.text =
                          DateFormatting.formatDateForTextField(value);
                    }
                  });
                }
              },
              child: SvgPicture.asset(AppIcons.calender),
            ),
          ),
        ),
      ],
    );
  }
}
