import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';

class EcText extends StatelessWidget {
  const EcText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            AppLocalizations.of(context)!.enterCodeTitle,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            AppLocalizations.of(context)!.enterCodeDescription,
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
