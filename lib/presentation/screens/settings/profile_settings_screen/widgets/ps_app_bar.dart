import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/edit_profile_screen.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';

class PsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PsAppBar({super.key});

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
                AppLocalizations.of(context)!.profileSettings,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: UnconstrainedBox(
              child: GestureDetector(
                onTap: () {
                  context.push(
                    EditProfileScreen.path,
                    extra: ProfileType.personal,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      child: Text(
                        AppLocalizations.of(context)!.profilePreviewLabel,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppSize.instance.width, kToolbarHeight);
}
