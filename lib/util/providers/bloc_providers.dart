
import 'package:help_mee/presentation/blocs/auth/signup/signup_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/change_password/change_password_bloc.dart';
import 'package:help_mee/util/providers/providers_exports.dart';
import 'package:help_mee/presentation/blocs/auth/signin/signin_bloc.dart';


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
    BlocProvider<GetUserProfileBloc>(create: (context) => GetUserProfileBloc(sl()))
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
    BlocProvider<AddProductBloc>(create: (context) => AddProductBloc(sl(),),),
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
    BlocProvider<UpdateLocationAndNotificationSettingsBloc>(create: (context) => UpdateLocationAndNotificationSettingsBloc(sl()),),
    BlocProvider<UpdateLocationSharingSettingBloc>(create: (context) => UpdateLocationSharingSettingBloc(sl())),
    BlocProvider<AddNotificationUserBloc>(create: (context) => AddNotificationUserBloc(sl()),),
    BlocProvider<UpdateNotificationUserBloc>(create: (context) => UpdateNotificationUserBloc(sl()),),    
    BlocProvider<DeleteNotificationUserBloc>(create: (context) => DeleteNotificationUserBloc(sl()),),        
    BlocProvider<GetNotificationUserBloc>(create: (context) => GetNotificationUserBloc(sl())),

    // Medical Information / Diseases blocs

    BlocProvider<AddDiseaseBloc>(create: (context) => AddDiseaseBloc(sl()),),
    BlocProvider<UpdateDiseaseBloc>(create: (context) => UpdateDiseaseBloc(sl()),),
    BlocProvider<DeleteDiseaseBloc>(create: (context) => DeleteDiseaseBloc(sl()),),
    BlocProvider<LockDiseaseBloc>(create: (context) => LockDiseaseBloc(sl()),),

    // Documents Blocs

    BlocProvider<UploadDocumentBloc>(create: (context) => UploadDocumentBloc(sl()),),
    BlocProvider<DeleteDocumentBloc>(create: (context) => DeleteDocumentBloc(sl()),),
    BlocProvider <LockDocumentBloc>(create: (context) => LockDocumentBloc(sl()),),

    // Voice note Blocs
    BlocProvider<UploadVoiceBloc>(create: (context) => UploadVoiceBloc(sl()),),
    BlocProvider<DeleteVoiceBloc>(create: (context) => DeleteVoiceBloc(sl()),),

    // Cooperation Partners bloc
    BlocProvider<GetCooperationPartnersBloc>(create: (context) => GetCooperationPartnersBloc(sl()),),
    BlocProvider<UpdateCooperationPartnerStatusBloc>(create: (context) => UpdateCooperationPartnerStatusBloc(sl(),),),

    // Hidden Features  
    BlocProvider<RestoreProductBloc>(create: (context) => RestoreProductBloc(sl(),),),

    // Profiles & Products
    BlocProvider<GetProductsBloc>(create: (context) => GetProductsBloc(sl()),),
    BlocProvider<UnmapProductBloc>(create: (context) => UnmapProductBloc(sl()),),
    BlocProvider<EditNameBloc>(create: (context) => EditNameBloc(sl())),

    // Demo profiles
    BlocProvider<GetDemoProfilesBloc>(create: (context) => GetDemoProfilesBloc(sl()),),
    BlocProvider<TransferDataBloc>(create: (context) => TransferDataBloc(sl())),

    BlocProvider<SwitchAccountBloc>(create: (context) => SwitchAccountBloc(sl())),
    BlocProvider<MakeChildWithExistingEmailBloc>(create: (context) => MakeChildWithExistingEmailBloc(sl())),
    BlocProvider<FeedbackBloc>(create: (context) => FeedbackBloc(sl())),
    BlocProvider<UpdateNameBloc>(create: (context) => UpdateNameBloc(sl())),
    BlocProvider<DeleteProfileAndMakeChildParentBloc>(create: (context) => DeleteProfileAndMakeChildParentBloc(sl())),
    
  ];
}
