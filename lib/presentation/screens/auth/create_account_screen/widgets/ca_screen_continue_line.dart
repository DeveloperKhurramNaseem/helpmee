import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/images.dart';

class CAScreenContinueLine extends StatelessWidget {
  const CAScreenContinueLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16),
      child: Row(
        children: [
          Expanded(child: SvgPicture.asset(AppImages.leftRect)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(AppLocalizations.of(context)!.continueWithLabel),
          ),
          Expanded(child: SvgPicture.asset(AppImages.rightRect)),
        ],
      ),
    );
  }
}
