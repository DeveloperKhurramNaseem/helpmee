import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class NfcScanBottomSheet extends StatelessWidget {
  const NfcScanBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ready to scan',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 2, 12, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tap your HelpMee product\nto the top of your phone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.42),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: AppSize.instance.height * 0.2,
                  width: AppSize.instance.height * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.instance.width * 0.12,
              vertical: AppSize.instance.height * 0.05,
            ),
            child: AppButton(
              onPressed: () {
                context.pop();
              },
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()?.primaryButton,
              child: Text(AppLocalizations.of(context)!.cancelText),
            ),
          ),
        ],
      ),
    );
  }
}
