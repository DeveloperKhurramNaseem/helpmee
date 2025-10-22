import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_important_widget.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class EpInsuranceInformation extends StatelessWidget {
  const EpInsuranceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: 'Insurance information',
          titleBorderColor: Theme.of(context).colorScheme.secondary,
          bodyBorderColor: AppLightThemeColors.boxBorderColor,
          child: Column(
            spacing: 10,
            children: [
              EpHeaderImportantBoxField(
                hint: 'Insurance company',
                maxLines: 2,
                controller: TextEditingController(),
              ),
              EpHeaderImportantBoxField(
                hint: 'Insurance ID',
                maxLines: 2,
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
