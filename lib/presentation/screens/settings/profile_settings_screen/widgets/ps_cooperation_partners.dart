import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/bottom_sheets/cooperation_parters_sheet.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class PsCooperationPartners extends StatelessWidget {
  const PsCooperationPartners({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 24),
                  child: Column(
                    spacing: 12,
                    children: [
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.cooperationPartnersFirstLabel,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.cooperationPartnersLastLabel,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(flex: 4),
                          Expanded(
                            flex: 92,
                            child: AppButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  enableDrag: true,
                                  showDragHandle: true,
                                  builder: (context) {
                                    return CooperationPartersSheet();
                                  },
                                );
                              },
                              gradient: Theme.of(
                                context,
                              ).extension<AppGradients>()!.primaryButton,
                              child: Text(
                                AppLocalizations.of(
                                  context,
                                )!.checkCooperationPartners,
                                textAlign: TextAlign.center,
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
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Text(
                AppLocalizations.of(context)!.cooperationPartnersLabel,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
