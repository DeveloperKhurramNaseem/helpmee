import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/index.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';
import 'package:intl/intl.dart';

class ProfileValiditySheet extends StatelessWidget {
  final bool isUnlimitedExpiry;
  const ProfileValiditySheet({super.key, this.isUnlimitedExpiry = false});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.profileValidityLabel,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Aleesha Haider',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppLightThemeColors.secondaryTextColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            if (isUnlimitedExpiry)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your profile has ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          TextSpan(
                            text: 'unlimited validity\n',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                            text: 'and will not expire',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your profile expires on ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          TextSpan(
                            text: DateFormat(
                              'MMM dd, yyyy',
                            ).format(DateTime.now()),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (!isUnlimitedExpiry)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.07)),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
                child: Column(
                  spacing: 7,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Extend the expiration date with a license key',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 18,
                      children: [
                        Expanded(
                          child: EpHeaderInfoBaseField(
                            hint: 'Enter license key here',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.w400,
                            ),
                            controller: TextEditingController(),
                            label: '',
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                        AppButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 45,
                          ),
                          gradient: Theme.of(
                            context,
                          ).extension<AppGradients>()?.primaryButton,
                          child: Text('Apply'),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 18,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Don\'t have a license key?',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        AppButtonOutlined(
                          onPressed: () {},
                          color: Theme.of(context).colorScheme.secondary,
                          borderColor: Theme.of(context).colorScheme.secondary,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 17,
                          ),
                          child: Text(
                            'Purchase now',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (!isUnlimitedExpiry)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Note',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppLightThemeColors.secondaryTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'The expiration date is automatically extended\nby two years if you activate a new HelpMee product.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppLightThemeColors.secondaryTextColor,
                            fontSize: 13,
                          ),
                        ),
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
