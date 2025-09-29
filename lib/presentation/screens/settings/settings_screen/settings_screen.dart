import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/hidden_settings/demo_profile/demo_profile_sheet.dart';
import 'package:help_mee/presentation/screens/settings/hidden_settings/product_restore/product_restore_sheet.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/bottom_sheets/language_bottom_sheet.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/bottom_sheets/notifications_sheet.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_base_tile.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_header.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_text.dart';
import 'package:help_mee/util/constants/icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(),
      body: CustomScrollView(
        slivers: [
          SettingsHeader(),
          SettingsDivider(),
          SettingsCategoryText(
            category: AppLocalizations.of(context)!.productsAndServices,
          ),
          SettingsBaseTile(
            titleText: 'Products & Profiles',
            image: AppIcons.plusSettings,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.orderHelpMeeProductsLabel,
            image: AppIcons.sos,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.feedbackLabel,
            image: AppIcons.feedback,
            onTap: () {},
          ),
          SettingsCategoryText(
            category: AppLocalizations.of(context)!.accountSettingsLabel,
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.switchAccountOrAddProfile,
            image: AppIcons.switchIcon,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.notificationsLabel,
            image: AppIcons.lock,
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (context) {
                  return ProductRestoreSheet();
                },
              );
            },
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.changePasswordButton,
            image: AppIcons.lock,
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (context) {
                  return NotificationsSheet();
                },
              );
            },
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.languageLabel,
            image: AppIcons.language,
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.profileValidityLabel,
            image: AppIcons.profileValidity,
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (context) {
                  return DemoProfileSheet();
                },
              );
            },
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.deleteProfilLabel,
            image: AppIcons.delete,
            onTap: () {},
          ),
          SettingsCategoryText(
            category: AppLocalizations.of(context)!.legalLabel,
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.privacyPolicyLabel,
            image: AppIcons.privacyIcon,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.termsAndConditionsLabel,
            image: AppIcons.privacyIcon,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.endUserAgreementTitle,
            image: AppIcons.privacyIcon,
            onTap: () {},
          ),
          SettingsDivider(),
          SettingsBaseTile(
            titleText: AppLocalizations.of(context)!.signOutLabel,
            image: AppIcons.signOutIcon,
            onTap: () {},
          ),

          SettingsVersionText(
            version: '${AppLocalizations.of(context)!.version} 3.5.0',
          ),
        ],
      ),
    );
  }
}
