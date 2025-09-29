import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/language/language_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_event.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.languageLabel,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: AppButtonOutlined(
              onPressed: () {
                context.read<LanguageBloc>().add(ChangeLanguageEvent(LocalizationUtil.english));
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context)!.languageLabelEnglish,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: AppButtonOutlined(
              onPressed: () {
                context.read<LanguageBloc>().add(ChangeLanguageEvent(LocalizationUtil.german));
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context)!.languageLabelGerman,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
