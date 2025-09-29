import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';

import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class CAScreenButton extends StatelessWidget {
  const CAScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    var gradients = Theme.of(context).extension<AppGradients>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: AppButton(
        onPressed: () {},
        gradient: gradients?.primaryButton,
        child: Text(
          AppLocalizations.of(context)!.signUpTitle,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}
