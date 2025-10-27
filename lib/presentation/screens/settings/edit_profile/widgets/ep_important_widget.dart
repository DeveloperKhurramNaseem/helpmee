import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/record_audio_sheet.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class EpImportantWidget extends StatelessWidget {
  const EpImportantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      sliver: SliverToBoxAdapter(
        child: EpInfoBaseBox(
          titleText: localization.important,
          titleBorderColor: Theme.of(context).colorScheme.primary,
          bodyBorderColor: Theme.of(context).colorScheme.primary,
          child: Column(
            spacing: 10,
            children: [
              EpHeaderImportantBoxField(
                hint: localization.addImportantNote,
                maxLines: 4,
                controller: TextEditingController(),
              ),
              Row(
                children: [
                  Spacer(flex: 19),
                  Expanded(
                    flex: 62,
                    child: AppButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          isScrollControlled: true,
                          builder: (context) {
                            return RecordAudioSheet();
                          },
                        );
                      },
                      gradient: Theme.of(
                        context,
                      ).extension<AppGradients>()!.primaryButton,
                      child: Text(
                        localization.recordAudio,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(flex: 19),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EpHeaderImportantBoxField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController controller;

  const EpHeaderImportantBoxField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppLightThemeColors.textfieldBorderColor),
        color: AppLightThemeColors.textfieldColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
      ),
    );
  }
}
