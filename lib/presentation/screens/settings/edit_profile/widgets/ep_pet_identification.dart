import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpPetIdentificationBox extends StatelessWidget {
  const EpPetIdentificationBox({super.key});

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
              EpPetChippedAndChippedPositionTile(),
              EpPetTaxAndTassoTile(),
              EpPetInsuranceRelatedTile(),
              Row(
                children: [
                  Expanded(
                    child: EpHeaderInfoBaseField(
                      label: 'Special Features',
                      controller: TextEditingController()..text = 'Khuram',
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
  const EpPetChippedAndChippedPositionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseDropDownStringField(
            items: ['Yes', 'No'],
            label: 'Chipped',
            value: 'Yes',
            onChanged: (value) {},
            trailing: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Chip Position',

            controller: TextEditingController()..text = 'Right Ear',
          ),
        ),
      ],
    );
  }
}

class EpPetTaxAndTassoTile extends StatelessWidget {
  const EpPetTaxAndTassoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Tax No',

            controller: TextEditingController()..text = '392847592',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Tasso No',

            controller: TextEditingController()..text = '392847592',
          ),
        ),
      ],
    );
  }
}

class EpPetInsuranceRelatedTile extends StatelessWidget {
  const EpPetInsuranceRelatedTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Insurance Company',
            controller: TextEditingController()..text = 'Pet Insurance',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: EpHeaderInfoBaseField(
            label: 'Insurance ID',
            controller: TextEditingController()..text = 'abc12344',
          ),
        ),
      ],
    );
  }
}
