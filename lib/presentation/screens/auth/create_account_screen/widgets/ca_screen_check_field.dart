import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class CAScreenCheckField extends StatelessWidget {
  final void Function(bool?) onChanged;
  final bool isChecked;
  const CAScreenCheckField({super.key, required this.onChanged, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    var fontSize = 14.0;    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
              value: isChecked,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(width: 0.2),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Theme.of(context).colorScheme.primary;
                }
                return Colors.transparent;
              }),
              checkColor: Colors.white,
              overlayColor: WidgetStatePropertyAll(Colors.white),
            ),
        Expanded(
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${AppLocalizations.of(context)!.agreeToLabel} ',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                TextSpan(
                  text: '${AppLocalizations.of(context)!.privacyPolicyLabel} ',
                  style: TextStyle(
                    color: AppLightThemeColors.blue,
                    fontSize: fontSize,
                  ),
                ),
                TextSpan(
                  text: '${AppLocalizations.of(context)!.andLabel} ',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.termsAndConditionsLabel,
                  style: TextStyle(
                    color: AppLightThemeColors.blue,
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
