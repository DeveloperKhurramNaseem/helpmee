
import 'package:flutter/material.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/services/native_services/native_safari_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';
import 'package:help_mee/util/constants/util_functions.dart';
import 'package:help_mee/util/dependencies/init.dart';

class PsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> openNativeSheet() async {

      var storageService = sl<StorageService>();
      var user = storageService.getUser();
      var profileType = getProfileType(user.userGroupId!).name.toString();
      var username = user.username;
      var url = getProfilePreviewUrl(profileType, username ?? '');

      NativeSheet.open(url);
    }

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
                  // showCupertinoSheet(
                  //             context: context,
                  //             enableDrag: true,
                  //             useNestedNavigation: true,
                  //             builder: (context) => ProfilePreviewSheet(),
                  //           );
                  openNativeSheet();
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
