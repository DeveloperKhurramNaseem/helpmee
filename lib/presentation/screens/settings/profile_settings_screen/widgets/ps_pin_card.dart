import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';

class PsPinCard extends StatelessWidget {
  const PsPinCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color.fromRGBO(228, 228, 228, 0.5)),
          ),
          color: Color.fromRGBO(246, 246, 246, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
            child: Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.protectProfileItemWithPin,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.protectProfileFirstText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.65),
                    fontSize: 12,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.protectProfileLastText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.65),
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Spacer(flex: 10),
                    Expanded(
                      flex: 80,
                      child: AppButtonOutlined(
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: Text(AppLocalizations.of(context)!.managePIN),
                      ),
                    ),
                    Spacer(flex: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
