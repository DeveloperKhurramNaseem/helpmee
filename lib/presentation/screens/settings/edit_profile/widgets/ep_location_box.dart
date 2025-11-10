import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/location_settings_sheet.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class EpLocationBox extends StatelessWidget {
  const EpLocationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 14.0),
      sliver: SliverToBoxAdapter(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(6, 35, 6, 10),
                  child: Column(
                    spacing: 20,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.emergencySubTitle,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                  fontSize: 15,

                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Switch(value: false, onChanged: (value) {}),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(flex: 19),
                          Expanded(
                            flex: 62,
                            child: AppButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  showDragHandle: true,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  builder: (context) {
                                    return LocationSettingsBottomSheet();
                                  },
                                );
                              },
                              gradient: Theme.of(
                                context,
                              ).extension<AppGradients>()!.primaryButton,
                              child: Text(
                                AppLocalizations.of(context)!.locationSetting,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Spacer(flex: 19),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment(-0.01, 0),
                child: SvgPicture.asset(
                  AppIcons.locationSend,
                  width: 33,
                  height: 33,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
