import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/edit_profile_screen.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class PsHeader extends StatelessWidget {
  const PsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var user = sl<StorageService>().getUser();
    var radius = MediaQuery.sizeOf(context).height * 0.06;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(top: radius),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Color.fromRGBO(228, 228, 228, 0.5)),
                ),
                color: Color.fromRGBO(246, 246, 246, 1),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, radius + 8, 8, 14),
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${user.firstName ?? ''} ${user.lastName ?? ''}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(flex: 4),
                          Expanded(
                            flex: 92,
                            child: AppButton(
                              onPressed: () {
                                // 9 because its a personal profile group id
                                context.push(
                                  EditProfileScreen.path,
                                  extra: getProfileType(
                                    sl<StorageService>()
                                            .getUser()
                                            .userGroupId ??
                                        9,
                                  ),
                                );
                              },
                              gradient: Theme.of(
                                context,
                              ).extension<AppGradients>()?.primaryButton,
                              child: Text(
                                AppLocalizations.of(
                                  context,
                                )!.editPersonalAndMedicalData,
                              ),
                            ),
                          ),
                          Spacer(flex: 4),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.5,
                ),
                // image: DecorationImage(
                //   image: AssetImage(AppImages.placeHolderPerson),
                // ),
              ),
              // padding: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: radius,
                backgroundImage: user.logo != null
                    ? NetworkImage(user.logo!)
                    : AssetImage(AppImages.placeHolderPerson),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
