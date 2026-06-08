import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/icons.dart';

class FbText extends StatelessWidget {
  const FbText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        AppLocalizations.of(context)!.feedbackLabel,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
      ),
    );
  }
}

class FbArrowBack extends StatelessWidget {
  const FbArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0, right: 14.0),
        child: SvgPicture.asset(AppIcons.arrowBack),
      ),
    );
  }
}
