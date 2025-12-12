import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/delete_profile/delete_profile_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/get_notifications_settings/get_notifications_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/update_notification_setting/update_notification_setting_bloc.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/products_screen.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/bottom_sheets/delete_profile_bottom_sheet.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/bottom_sheets/switch_profile_bottom_sheet.dart';
import 'package:help_mee/presentation/screens/settings/change_password_screen/change_password_screen.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/profile_validity_sheet.dart';
import 'package:help_mee/presentation/screens/settings/feedback_screen/feedback_screen.dart';
import 'package:help_mee/presentation/screens/settings/hidden_settings/demo_profile/demo_profile_sheet.dart';
// import 'package:help_mee/presentation/screens/settings/hidden_settings/product_restore/product_restore_sheet.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/bottom_sheets/language_bottom_sheet.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/bottom_sheets/notifications_sheet.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/widgets/settings_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/widgets/settings_base_tile.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/widgets/settings_header.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/widgets/settings_text.dart';
import 'package:help_mee/presentation/screens/settings/hidden_settings/product_restore/product_restore_sheet.dart';
import 'package:help_mee/util/common_widgets/show_toast.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;
import 'package:help_mee/util/extension/string_modification.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends StatefulWidget {
  static const path = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetNotificationsSettingsBloc>().add(
      GetGeneralNotificationSettingsEvent(),
    );    
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return MultiBlocListener(
      listeners: [
        BlocListener<
          UpdateNotificationSettingBloc,
          UpdateNotificationSettingState
        >(listener: _updateNotificationListener),
        BlocListener<DeleteProfileBloc, DeleteProfileState>(
          listener: _listenDeleteProfileListener,
        ),
      ],
      child: Scaffold(
        appBar: SettingsAppBar(),
        body: CustomScrollView(
          slivers: [
            SettingsHeader(),
            SettingsDivider(),
            SettingsCategoryText(category: localization.productsAndServices),
            SettingsBaseTile(
              titleText: localization.myProductsTitle,
              image: AppIcons.plusSettings,
              onTap: () {
                context.push(ProductsScreen.path);
              },
            ),
            SettingsBaseTile(
              titleText: AppLocalizations.of(
                context,
              )!.orderHelpMeeProductsLabel,
              image: AppIcons.sos,
              onTap: () {
                localization.buyHelpMeeProductLink.launchUrl();
              },
            ),
            SettingsBaseTile(
              titleText: localization.feedbackLabel,
              image: AppIcons.feedback,
              onTap: () {
                context.push(FeedbackScreen.path);
              },
            ),
            SettingsCategoryText(category: localization.accountSettingsLabel),
            SettingsBaseTile(
              titleText: localization.switchAccountOrAddProfile,
              image: AppIcons.switchIcon,
              onTap: () {
                m.showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return SwitchProfileBottomSheet();
                  },
                );
              },
            ),
            SettingsBaseTile(
              titleText: localization.notificationsLabel,
              image: AppIcons.lock,
              onTap: () {
                m.showModalBottomSheet(
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
              titleText: localization.changePasswordButton,
              image: AppIcons.lock,
              onTap: () {
                context.push(ChangePasswordScreen.path);
              },
            ),
            SettingsBaseTile(
              titleText: localization.languageLabel,
              image: AppIcons.language,
              onTap: () {
                m.showModalBottomSheet(
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
              titleText: localization.profileValidityLabel,
              image: AppIcons.profileValidity,
              onTap: () {
                m.showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return ProfileValiditySheet(isUnlimitedExpiry: false);
                  },
                );
              },
            ),
            SettingsBaseTile(
              titleText: localization.deleteProfilLabel,
              image: AppIcons.delete,
              onTap: () {
                m.showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return DeleteProfileBottomSheet(
                      makeChildParent: false,
                    );
                  },
                );
              },
            ),
            SettingsCategoryText(category: localization.legalLabel),
            SettingsBaseTile(
              titleText: localization.privacyPolicyLabel,
              image: AppIcons.privacyIcon,
              onTap: () {
                localization.privacyPolicyLink.launchUrl();
              },
            ),
            SettingsBaseTile(
              titleText: localization.termsAndConditionsLabel,
              image: AppIcons.privacyIcon,
              onTap: () {
                localization.termsAndConditionsLink.launchUrl();
              },
            ),
            SettingsBaseTile(
              titleText: localization.endUserAgreementTitle,
              image: AppIcons.privacyIcon,
              onTap: () {
                localization.endUserLicenseAgreementLink.launchUrl();
              },
            ),
            SettingsCategoryText(category: 'Testing'),
            SettingsBaseTile(
              titleText: localization.demoProfileTitle,
              image: AppIcons.profileValidity,
              onTap: () {
                m.showModalBottomSheet(
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
              titleText: localization.resetProductTitle,
              image: AppIcons.profileValidity,
              onTap: () {
                m.showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return ProductRestoreSheet();
                  },
                );
              },
            ),
            SettingsDivider(),
            SettingsBaseTile(
              titleText: localization.signOutLabel,
              image: AppIcons.signOutIcon,
              onTap: () {
                sl<StorageService>().clearData();                
                sl<TokenService>().saveToken('').then((_) {
                  context.go(SignInScreen.path);
                });
              },
            ),
            SettingsVersionText(version: '${localization.version} ${sl<PackageInfo>().version}'),
          ],
        ),
      ),
    );
  }

  void _updateNotificationListener(
    BuildContext context,
    UpdateNotificationSettingState state,
  ) {
    if (state is UpdateNotificationSettingDoneState ||
        state is UpdateNotificationSettingErrorState) {
      Navigator.of(context).pop();
      context.read<GetNotificationsSettingsBloc>().add(
        GetGeneralNotificationSettingsEvent(),
      );
    }
  }

  void _listenDeleteProfileListener(
    BuildContext context,
    DeleteProfileState state,
  ) {
    if (state is DeleteProfileDoneState) {
      sl<StorageService>().clearData();
      sl<TokenService>().saveToken('').then((_) {
        context.go(SignInScreen.path);
      });
    } else if (state is DeleteProfileErrorState) {
      showError(state.message);
    }
  }
}
