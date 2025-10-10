import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/forget_password/forget_password_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/signin/signin_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/signup/signup_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/verifyotp/verify_otp_bloc.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_state.dart';
import 'package:help_mee/presentation/blocs/onboarding/activate_product/activate_product_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/get_notifications_settings/get_notifications_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/update_notification_setting/update_notification_setting_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/set_pin_bloc/set_pin_bloc.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';

List<BlocProvider> getUniversalBlocProviders() {
  return [
    BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc(
        LanguageState(LocalizationUtil.locales[LocalizationUtil.english]!),
      ),
    ),
  ];
}

List<BlocProvider> getAuthBlocProviders() {
  return [
    BlocProvider<SignupBloc>(create: (context) => SignupBloc(sl())),
    BlocProvider<SigninBloc>(create: (context) => SigninBloc(sl())),
    BlocProvider<VerifyOtpBloc>(create: (context) => VerifyOtpBloc(sl())),
    BlocProvider<ForgetPasswordBloc>(
      create: (context) {
        return ForgetPasswordBloc(sl());
      },
    ),
  ];
}

List<BlocProvider> getActivateProductBlocProviders() {
  return [
    BlocProvider<ActivateProductBloc>(
      create: (context) => ActivateProductBloc(sl()),
    ),
  ];
}

List<BlocProvider> getDashboardBlocProviders() {
  return [
    BlocProvider<LatestNotificationsBloc>(
      create: (context) => LatestNotificationsBloc(sl()),
    ),
    BlocProvider<AllNotificationsBloc>(
      create: (context) => AllNotificationsBloc(sl()),
    ),
  ];
}

List<BlocProvider> getSettingsBlocProviders() {
  return [
    BlocProvider<GetNotificationsSettingsBloc>(
      create: (context) => GetNotificationsSettingsBloc(sl()),
    ),
    BlocProvider<UpdateNotificationSettingBloc>(
      create: (context) => UpdateNotificationSettingBloc(sl()),
    ),
    BlocProvider<SetPinBloc>(
      create: (context) {
        return SetPinBloc(sl());
      },
    ),
  ];
}
