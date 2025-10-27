import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';

class EpPetNameField extends StatelessWidget {
  final TextEditingController controller;
  const EpPetNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 4),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: EpHeaderInfoBaseField(
                label: AppLocalizations.of(context)!.name,
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EpPetRaceField extends StatelessWidget {
  final TextEditingController controller;
  const EpPetRaceField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 4),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: EpHeaderInfoBaseField(
                label: AppLocalizations.of(context)!.race,
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
