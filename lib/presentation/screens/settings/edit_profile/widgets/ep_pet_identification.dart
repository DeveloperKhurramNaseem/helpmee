import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpPetIdentificationBox extends StatelessWidget {
  final String chipped;
  final TextEditingController chippedPositionController;
  final TextEditingController taxNoController, tassoNoController;
  final TextEditingController petInsuranceCompanyController,
      petInsuranceIdController;
  final TextEditingController specialFeaturesController;
  final void Function(String? value) onChipChanged;
  const EpPetIdentificationBox({
    super.key,
    required this.chippedPositionController,
    required this.taxNoController,
    required this.tassoNoController,
    required this.petInsuranceCompanyController,
    required this.petInsuranceIdController,
    required this.specialFeaturesController,
    required this.chipped,
    required this.onChipChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: 'Identification',
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              EpPetChippedAndChippedPositionTile(
                chippedValue: chipped,
                onChipChanged: onChipChanged,
                chipPositionController: chippedPositionController,
              ),
              EpPetTaxAndTassoTile(
                taxNoController: taxNoController,
                tassoNoController: tassoNoController,
              ),
              EpPetInsuranceRelatedTile(
                petInsuranceCompanyController: petInsuranceCompanyController,
                petInsuranceIdController: petInsuranceIdController,
              ),
              Row(
                children: [
                  Expanded(
                    child: EpHeaderInfoBaseField(
                      label: 'Special Features',
                      controller: specialFeaturesController,
                    ),
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

class EpPetChippedAndChippedPositionTile extends StatelessWidget {
  final String chippedValue;
  final void Function(String? value) onChipChanged;
  final TextEditingController chipPositionController;
  const EpPetChippedAndChippedPositionTile({
    super.key,
    required this.chippedValue,
    required this.onChipChanged,
    required this.chipPositionController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseDropDownStringField(
            items: TextFieldsConstants.chippedValues,
            label: 'Chipped',
            value: chippedValue,
            onChanged: onChipChanged,
            trailing: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Chip Position',

            controller: chipPositionController,
          ),
        ),
      ],
    );
  }
}

class EpPetTaxAndTassoTile extends StatelessWidget {
  final TextEditingController taxNoController, tassoNoController;
  const EpPetTaxAndTassoTile({
    super.key,
    required this.taxNoController,
    required this.tassoNoController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Tax No',
            controller: taxNoController,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Tasso No',
            controller: tassoNoController,
          ),
        ),
      ],
    );
  }
}

class EpPetInsuranceRelatedTile extends StatelessWidget {
  final TextEditingController petInsuranceCompanyController,
      petInsuranceIdController;
  const EpPetInsuranceRelatedTile({
    super.key,
    required this.petInsuranceCompanyController,
    required this.petInsuranceIdController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Insurance Company',
            controller: petInsuranceCompanyController,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Insurance ID',
            controller: petInsuranceIdController,
          ),
        ),
      ],
    );
  }
}
