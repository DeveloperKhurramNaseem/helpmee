class EndPoints {
  static const signUp = '/signup';
  static const signIn = '/login';
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

  // User Profile Endpoints
  static const getUserProfile = '/get-edit-profile-data';
  static const updateBasicProfileInfo = '/sos-profile-update';
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
  static const addNotificationUser = '/add-notification-user';
  static const updateNotificationUser = '/update-notification-user';
  static const deleteNotificationUser = '/delete-notification-user';
  
}