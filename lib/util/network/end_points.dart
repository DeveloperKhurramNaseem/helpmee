
class EndPoints {
  static const signUp = '/signup';
  static const signIn = '/login';
  static const socialSignIn = '/social-login';
  static const verifySignUpOtp = '/verify-signup-otp';
  static const latestNotifications = '/five_latest_notification';
  static const allNotifications = '/all_notification';
  static const activateProduct = '/activate/code';
  static const forgetPassword = '/forget-password';
  static const forgetPasswordSendCode = '/send_pincode';
  static const verifyForgetPasswordOtp = '/verify_pincode';
  static const notificationSettings = '/general_notification_settings';
  static const notificationSettingsChange = '/general_notification_settings_change';
  static const setNewPin = '/create-pin-code';
  static const updatePin = '/update-pin-code';
  static const createNewPassword = '/forget-password';
  static const deleteAccount = '/delete-user-account';
  static const changePassword = '/change-password';
  static const resendOtp = '/send_otp';
  static const userProfile = '/user_profile';

  // User Profile Endpoints
  static const getUserProfile = '/get-edit-profile-data';
  static const getPetUserProfile = '/pet-edit-profile';
  static const updateBasicProfileInfo = '/sos-profile-update';
  static const updateBasicPetProfileInfo = '/pet-profile-update';
  static const addFamilyContact = '/create-contact';
  static const addDoctorContact = '/create-doctor-contact';
  static const deleteContact = '/delete-contact';
  static const updateContact = '/update-contact';
  static const addAddress = '/add-address';
  static const deleteAddress = '/delete-address';
  static const updateAddress = '/update-address';

  // Location Notification Settings Endpoints
  static const getLocationNotificationSettings = '/notification-setting';
  static const updateLocationNotificationSettings = '/notification-setting-change';
  static const locationSharingSetting = '/location_sharing_setting_change';
  static const getNotificationUsers = '/notification-users';
  static const addNotificationUser = '/add-notification-user';
  static const updateNotificationUser = '/update-notification-user';
  static const deleteNotificationUser = '/delete-notification-user';

  // Disease Endpoints
  static const addDisease = '/add-disease';
  static const updateDisease = '/update-disease';
  static const deleteDisease = '/delete-disease';
  static const lockDisease = '/lock-disease';

  // Document Endpoints
  static const uploadMedicationDocument = '/upload-medication-plan-document';
  static const uploadSimpleDocument = '/upload-document';
  static const deleteDocument = '/delete-document';
  static const lockDocument = '/lock-document';
  static const uploadVoice = '/upload-voice-record';
  static const deleteVoice = '/delete-voice-record';

  // Cooperation Partners
  static const getCooperationPartners = '/cooperationPartnersProfiles';
  static const activateCooperationPartners = '/cooperationPartnersProfileActiveInactivated';
  static const restoreDevice = '/return-device';

  // Profiles & Products
  static const productsList = '/device_list';
  static const updateProductName = '/update-device-name';
  static const unmapProduct = '/unmap-device';
  static const getDemoProfiles = '/get-demo-profiles';
  static const transferData = '/influencerProfileDataTransferTransition';
  static const switchAccount = '/switch-account';
  static const makeChildWithExistingEmail = '/make_child_with_existing_email';
  static const sendFeedback = '/feedback';
  
}