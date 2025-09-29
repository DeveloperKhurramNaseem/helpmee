import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class PsHeader extends StatelessWidget {
  const PsHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
                            'Aleesha Haider',
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
                              onPressed: () {},
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
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                radius: radius,
                child: Icon(Icons.person, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
