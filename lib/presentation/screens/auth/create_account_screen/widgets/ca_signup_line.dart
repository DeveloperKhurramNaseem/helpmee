import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';

class CASignInLine extends StatelessWidget {
  const CASignInLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.doYouHaveAccountLabel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.signInTitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
