import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_important_widget.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpInsuranceInformation extends StatelessWidget {
  final TextEditingController insuranceCompanyController, insuranceIDController;
  const EpInsuranceInformation({
    super.key,
    required this.insuranceCompanyController,
    required this.insuranceIDController,
  });

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: localization.insuranceInformation,
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              EpHeaderImportantBoxField(
                hint: localization.insuranceCompany,
                maxLines: 2,
                controller: insuranceCompanyController,
              ),
              EpHeaderImportantBoxField(
                hint: localization.insuranceID,
                maxLines: 2,
                controller: insuranceIDController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
