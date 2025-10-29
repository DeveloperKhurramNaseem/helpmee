import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/presentation/blocs/auth/create_password_bloc/create_password_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/forget_password/forget_password_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/resend_otp/resend_otp_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/signin/signin_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/signup/signup_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/verifyotp/verify_otp_bloc.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_bloc.dart';
import 'package:help_mee/presentation/blocs/language/language_state.dart';
import 'package:help_mee/presentation/blocs/onboarding/activate_product/activate_product_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/delete_profile/delete_profile_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/get_notifications_settings/get_notifications_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/update_notification_setting/update_notification_setting_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/change_password/change_password_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/add_address/add_address_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/add_doctor_contact/add_doctor_contact_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/add_family_contact/add_family_contact_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/delete_address/delete_address_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/delete_contact/delete_contact_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/update_address/update_address_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/update_contact/update_contact_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/location_notification_settings/get_location_notification_settings/get_location_notification_settings_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/update_basic_info/update_basic_info_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/get_profile_data/get_profile_data_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/set_pin_bloc/set_pin_bloc.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/localication_util/localization_util.dart';

List<BlocProvider> getUniversalBlocProviders() {
  var storageService = sl<StorageService>();
  var langCode = storageService.getLanguage();
  String key = langCode == 'en'
      ? LocalizationUtil.english
      : LocalizationUtil.german;

  return [
    BlocProvider<LanguageBloc>(
      create: (context) =>
          LanguageBloc(LanguageState(LocalizationUtil.locales[key]!), sl()),
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
    BlocProvider<CreatePasswordBloc>(
      create: (context) => CreatePasswordBloc(sl()),
    ),
    BlocProvider<ResendOtpBloc>(create: (context) => ResendOtpBloc(sl())),
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
    BlocProvider<DeleteProfileBloc>(
      create: (context) => DeleteProfileBloc(sl()),
    ),
    BlocProvider<ChangePasswordBloc>(
      create: (context) => ChangePasswordBloc(sl()),
    ),
  ];
}

List<BlocProvider> getUserProfileBlocProviders() {
  return [
    // Get profile data
    BlocProvider<GetProfileDataBloc>(
      create: (context) => GetProfileDataBloc(sl()),
    ),

    // Update basic info
    BlocProvider<UpdateBasicInfoBloc>(create: (context) => UpdateBasicInfoBloc(sl()),),

    // Add contacts (Family / Doctor)
    BlocProvider<AddFamilyContactBloc>(create: (context) => AddFamilyContactBloc(sl()),),
    BlocProvider<AddDoctorContactBloc>(create: (context) => AddDoctorContactBloc(sl()),),

    // Delete and Update contacts
    BlocProvider<DeleteContactBloc>(create: (context) => DeleteContactBloc(sl()),),
    BlocProvider<UpdateContactBloc>(create: (context) => UpdateContactBloc(sl()),),

    // Address related blocs
    BlocProvider<AddAddressBloc>(create: (context) => AddAddressBloc(sl()),),
    BlocProvider<DeleteAddressBloc>(create: (context) => DeleteAddressBloc(sl()),),
    BlocProvider<UpdateAddressBloc>(create: (context) => UpdateAddressBloc(sl()),),  

    // Location and Notification Setting blocs

    BlocProvider<GetLocationNotificationSettingsBloc>(create: (context) => GetLocationNotificationSettingsBloc(sl()),),
    
  ];
}
