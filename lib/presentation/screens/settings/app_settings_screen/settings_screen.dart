import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/delete_profile/delete_profile_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/get_notifications_settings/get_notifications_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/update_notification_setting/update_notification_setting_bloc.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/bottom_sheets/delete_profile_bottom_sheet.dart';
import 'package:help_mee/presentation/screens/settings/change_password_screen/change_password_screen.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/profile_validity_sheet.dart';
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

class SettingsScreen extends StatefulWidget {
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
            SettingsCategoryText(
              category: AppLocalizations.of(context)!.productsAndServices,
            ),
            SettingsBaseTile(
              titleText: 'Products & Profiles',
              image: AppIcons.plusSettings,
              onTap: () {},
            ),
            SettingsBaseTile(
              titleText: AppLocalizations.of(
                context,
              )!.orderHelpMeeProductsLabel,
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
              titleText: AppLocalizations.of(
                context,
              )!.switchAccountOrAddProfile,
              image: AppIcons.switchIcon,
              onTap: () {},
            ),
            SettingsBaseTile(
              titleText: AppLocalizations.of(context)!.notificationsLabel,
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
              titleText: AppLocalizations.of(context)!.changePasswordButton,
              image: AppIcons.lock,
              onTap: () {
                context.push(ChangePasswordScreen.path);
              },
            ),
            SettingsBaseTile(
              titleText: AppLocalizations.of(context)!.languageLabel,
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
              titleText: AppLocalizations.of(context)!.profileValidityLabel,
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
              titleText: AppLocalizations.of(context)!.deleteProfilLabel,
              image: AppIcons.delete,
              onTap: () {
                m.showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return DeleteProfileBottomSheet();
                  },
                );
              },
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
            SettingsCategoryText(category: 'Testing'),
            SettingsBaseTile(
              titleText: AppLocalizations.of(context)!.demoProfileTitle,
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
              titleText: AppLocalizations.of(context)!.resetProductTitle,
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
              titleText: AppLocalizations.of(context)!.signOutLabel,
              image: AppIcons.signOutIcon,
              onTap: () {
                sl<TokenService>().saveToken('').then((_) {
                  context.go(SignInScreen.path);
                });
              },
            ),

            SettingsVersionText(
              version: '${AppLocalizations.of(context)!.version} 3.5.0',
            ),
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
      sl<TokenService>().saveToken('').then((_) {
        context.go(SignInScreen.path);
      });
    } else if (state is DeleteProfileErrorState) {
      showToast(state.message);
    }
  }
}
