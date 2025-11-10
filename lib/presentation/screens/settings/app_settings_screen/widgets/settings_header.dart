import 'package:flutter/material.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/profile_settings_screen.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var user = sl<StorageService>().getUser();
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.5,
                ),
              ),
              // padding: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40,
                backgroundImage: user.logo != null
                    ? NetworkImage(user.logo!)
                    : AssetImage(AppImages.placeHolderPerson),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName ?? ''} ${user.lastName ?? ''}',
                    // '',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      // AppButtonOutlined(onPressed: onPressed, child: child)
                      Expanded(
                        flex: 46,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary.withAlpha(100),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 8),
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
                      Spacer(flex: 4),
                      Expanded(
                        flex: 46,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfileSettingsScreen(),
                              ),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: Theme.of(
                                context,
                              ).extension<AppGradients>()?.primaryButton,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                AppLocalizations.of(context)!.editProfileLabel,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 4),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
