import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/activation_method_screen.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class ProductResetSuccess extends StatelessWidget {
  const ProductResetSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.productResetTitle,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
            child: Text(
              AppLocalizations.of(context)!.productResetDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.8),
                fontSize: 13,
              ),
            ),
          ),
          Row(
            children: [
              Spacer(flex: 15),
              Expanded(
                flex: 70,
                child: AppButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ActivationMethodScreen(),
                      ),
                    );
                  },
                  gradient: Theme.of(
                    context,
                  ).extension<AppGradients>()?.primaryButton,
                  child: Text(AppLocalizations.of(context)!.restAnotherTitle),
                ),
              ),
              Spacer(flex: 15),
            ],
          ),
        ],
      ),
    );
  }
}
