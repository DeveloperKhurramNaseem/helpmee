import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_medical_information_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpMedicalInformation extends StatelessWidget {
  const EpMedicalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: AppLocalizations.of(context)!.medicalInformation,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              MedicalInformationTile(text: 'Allergies'),
              MedicalInformationTile(text: 'Infectious diseases'),
              MedicalInformationTile(text: 'Coagulation disorders'),
              AddMedicalInformationTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddMedicalInformationTile extends StatelessWidget {
  const AddMedicalInformationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addMedicationInformationButton,
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return AddMedicalInformationSheet();
          },
        );
      },
    );
  }
}

class MedicalInformationTile extends StatelessWidget {
  final String text;
  const MedicalInformationTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return EpBaseTile(title: text, onTap: () {}, state: BaseTileState.simple);
  }
}
