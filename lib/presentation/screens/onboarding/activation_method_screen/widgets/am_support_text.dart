import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class AmSupportText extends StatelessWidget {
  const AmSupportText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.cannotActivateNeedSupport,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          TextSpan(
            text: ' ${AppLocalizations.of(context)!.supportText}',
            style: TextStyle(color: AppLightThemeColors.blue),
          ),
        ],
      ),
    );
  }
}
