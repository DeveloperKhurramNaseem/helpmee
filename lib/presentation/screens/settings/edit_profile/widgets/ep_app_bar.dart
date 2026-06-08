import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class EpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showButton;
  final VoidCallback onTap;
  const EpAppBar({super.key, required this.showButton, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.editProfileLabel,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          showButton
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: UnconstrainedBox(
                    child: AppButton(
                      onPressed: onTap,
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 28,
                      ),
                      gradient: Theme.of(
                        context,
                      ).extension<AppGradients>()?.primaryButton,
                      child: Text(
                        AppLocalizations.of(context)!.saveButton,
                        style: TextStyle(),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppSize.instance.width, kToolbarHeight);
}
