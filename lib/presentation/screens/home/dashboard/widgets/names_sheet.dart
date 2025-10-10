import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class NamesSheet extends StatelessWidget {
  const NamesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.enterNamePrompt,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              decoration: InputDecoration(
                border: TextFieldsConstants.border,
                labelText: AppLocalizations.of(context)!.firstNameLabel,
                helperText: '',
                focusedBorder: TextFieldsConstants.border,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
              ),
              cursorColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              decoration: InputDecoration(
                border: TextFieldsConstants.border,
                labelText: AppLocalizations.of(context)!.lastNameLabel,
                helperText: '',
                focusedBorder: TextFieldsConstants.border,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
              ),
              cursorColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: AppButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()?.primaryButton,
              child: Text(AppLocalizations.of(context)!.next),
            ),
          ),
        ],
      ),
    );
  }
}
