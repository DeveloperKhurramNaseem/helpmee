import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/extension/string_modification.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class FbCheckLine extends StatelessWidget {
  final void Function(bool?) onChanged;
  final bool isChecked;
  const FbCheckLine({
    super.key,
    required this.onChanged,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var fontSize = 12.0;
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
                  text: '${localization.feedbackReadAndAgree} ',
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
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      AppLocalizations.of(
                        context,
                      )!.privacyPolicyLink.launchUrl();
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
