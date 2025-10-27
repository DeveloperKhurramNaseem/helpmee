import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_base_boxes_and_tiles.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class UploadPictureDocumentSheet extends StatelessWidget {
  const UploadPictureDocumentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upload Picture / Document',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Here you can upload images or PDF documents to be displayed on your HelpMee profile.\n\nExamples\nVaccination card, organ donor card, living will, doctor\'s letters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppLightThemeColors.secondaryTextColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
            child: EpHeaderInfoBaseField(
              label: 'File Name',
              controller: TextEditingController()..text = 'Vaccination',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 50),
            child: EpBaseAddTile(
              title: 'Upload picture / document',
              onTap: () {
               
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: AppButton(
              onPressed: () {},
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()!.primaryButton,
              child: Text(
                AppLocalizations.of(context)!.saveButton,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
