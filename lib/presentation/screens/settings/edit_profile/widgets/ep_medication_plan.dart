import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_address_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpMedicationPlan extends StatelessWidget {
  const EpMedicationPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseWithoutTitleBorderBox(
          titleText: AppLocalizations.of(context)!.medicationPlanLabel,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              for (var i = 0; i < 2; i++)
                AddMedicationPdfTile(text: 'Medication Plan ${i + 1}'),
              AddMedicationPlanTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddMedicationPlanTile extends StatelessWidget {
  const AddMedicationPlanTile({super.key});

  @override
  Widget build(BuildContext context) {
    return EpBaseAddTile(
      title: AppLocalizations.of(context)!.addMedicationPlanButton,
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

class AddMedicationPdfTile extends StatelessWidget {
  final String text;
  const AddMedicationPdfTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return EpBaseTile(title: text, state: BaseTileState.pdf, onTap: () {});
  }
}
