import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';

class CpText extends StatelessWidget {
  final bool isChangePassword;
  const CpText({super.key, required this.isChangePassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            isChangePassword
                ? AppLocalizations.of(context)!.changePasswordButton
                : AppLocalizations.of(context)!.createPasswordLabel,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Use at least 8 characters including letters and numbers',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary.withAlpha(150),
            ),
          ),
        ),
      ],
    );
  }
}
