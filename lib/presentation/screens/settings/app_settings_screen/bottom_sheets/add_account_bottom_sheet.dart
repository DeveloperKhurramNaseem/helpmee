import 'dart:io';
import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class AddAccountBottomSheet extends StatelessWidget {
  const AddAccountBottomSheet({super.key});

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
                  AppLocalizations.of(context)!.addAccountButton,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: AppButton(
              onPressed: () {
                
              },
              gradient: Theme.of(context).extension<AppGradients>()!.primaryButton,
              child: Text(
                AppLocalizations.of(context)!.signInToExistingAccount,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              24.0,
              8.0,
              24.0,
              Platform.isAndroid ? 12 : 8,
            ),
            child: AppButtonOutlined(
              onPressed: () {
                
              },
              child: Text(
                AppLocalizations.of(context)!.createWithNewEmail,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
