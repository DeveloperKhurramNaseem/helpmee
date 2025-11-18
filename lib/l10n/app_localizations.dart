import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get language;

  /// No description provided for @languageLabelEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageLabelEnglish;

  /// No description provided for @languageLabelGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageLabelGerman;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start'**
  String get letsStart;

  /// No description provided for @createAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAccountTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get errorInvalidEmail;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpTitle;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @errorInvalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get errorInvalidPassword;

  /// No description provided for @errorPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Password does not match'**
  String get errorPasswordMismatch;

  /// No description provided for @errorPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Your password must be at least 6 characters long'**
  String get errorPasswordTooShort;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPasswordLabel;

  /// No description provided for @continueWithLabel.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get continueWithLabel;

  /// No description provided for @privacyPolicyLabel.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyLabel;

  /// No description provided for @doYouHaveAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account? '**
  String get doYouHaveAccountLabel;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInTitle;

  /// No description provided for @agreeToLabel.
  ///
  /// In en, this message translates to:
  /// **'Agree to'**
  String get agreeToLabel;

  /// No description provided for @andLabel.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get andLabel;

  /// No description provided for @termsAndConditionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditionsLabel;

  /// No description provided for @dontHaveAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccountLabel;

  /// No description provided for @forgotPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPasswordLabel;

  /// No description provided for @welcomeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBackTitle;

  /// No description provided for @signInPrompt.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get signInPrompt;

  /// No description provided for @enterRegisteredEmailPrompt.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address you used to sign up with your account'**
  String get enterRegisteredEmailPrompt;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @enterCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get enterCodeTitle;

  /// No description provided for @enterCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'We have sent a 6 digit code to your email address'**
  String get enterCodeDescription;

  /// No description provided for @verifyButton.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verifyButton;

  /// No description provided for @createPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Create password'**
  String get createPasswordLabel;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @askProductPrompt.
  ///
  /// In en, this message translates to:
  /// **'Do you have a product?'**
  String get askProductPrompt;

  /// No description provided for @yesStartProductActivation.
  ///
  /// In en, this message translates to:
  /// **'Yes, let’s start the product activation'**
  String get yesStartProductActivation;

  /// No description provided for @goToHelpMeeShop.
  ///
  /// In en, this message translates to:
  /// **'No, let’s go to the HelpMee shop'**
  String get goToHelpMeeShop;

  /// No description provided for @chooseActivationMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose Activation Method'**
  String get chooseActivationMethod;

  /// No description provided for @tapToActivateNfc.
  ///
  /// In en, this message translates to:
  /// **'Tap to activate via NFC'**
  String get tapToActivateNfc;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan to activate via QR code'**
  String get scanQrCode;

  /// No description provided for @cannotActivateNeedSupport.
  ///
  /// In en, this message translates to:
  /// **'I can’t activate my product and need'**
  String get cannotActivateNeedSupport;

  /// No description provided for @supportText.
  ///
  /// In en, this message translates to:
  /// **'support'**
  String get supportText;

  /// No description provided for @qrCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'QR Code'**
  String get qrCodeLabel;

  /// No description provided for @notificationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsLabel;

  /// No description provided for @homeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  /// No description provided for @recentNotificationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Recent Notifications'**
  String get recentNotificationsLabel;

  /// No description provided for @profilePreviewLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile preview'**
  String get profilePreviewLabel;

  /// No description provided for @editProfileLabel.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfileLabel;

  /// No description provided for @productsAndServices.
  ///
  /// In en, this message translates to:
  /// **'Products & Services'**
  String get productsAndServices;

  /// No description provided for @orderHelpMeeProductsLabel.
  ///
  /// In en, this message translates to:
  /// **'Buy HelpMee products'**
  String get orderHelpMeeProductsLabel;

  /// No description provided for @feedbackLabel.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedbackLabel;

  /// No description provided for @accountSettingsLabel.
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get accountSettingsLabel;

  /// No description provided for @switchAccountOrAddProfile.
  ///
  /// In en, this message translates to:
  /// **'Add / switch profile'**
  String get switchAccountOrAddProfile;

  /// No description provided for @changePasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordButton;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @profileValidityLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile validity'**
  String get profileValidityLabel;

  /// No description provided for @deleteProfilLabel.
  ///
  /// In en, this message translates to:
  /// **'Delete profile'**
  String get deleteProfilLabel;

  /// No description provided for @legalLabel.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legalLabel;

  /// No description provided for @endUserAgreementTitle.
  ///
  /// In en, this message translates to:
  /// **'End User License Agreement'**
  String get endUserAgreementTitle;

  /// No description provided for @signOutLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOutLabel;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @settingsLabel.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsLabel;

  /// No description provided for @notificationSettingLabel.
  ///
  /// In en, this message translates to:
  /// **'Notifications settings'**
  String get notificationSettingLabel;

  /// No description provided for @genericNotificationSettingLabel.
  ///
  /// In en, this message translates to:
  /// **'Here you can decide how you want to be notified by the app.'**
  String get genericNotificationSettingLabel;

  /// No description provided for @pushNotificationLabel.
  ///
  /// In en, this message translates to:
  /// **'Push notification'**
  String get pushNotificationLabel;

  /// No description provided for @sendPushMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Throws push messages, even if the app is not open'**
  String get sendPushMessageLabel;

  /// No description provided for @inAppNotification.
  ///
  /// In en, this message translates to:
  /// **'In-app notification'**
  String get inAppNotification;

  /// No description provided for @sendNotificationsMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Shows notifications in the home menu’s notification center'**
  String get sendNotificationsMessageLabel;

  /// No description provided for @emailNotification.
  ///
  /// In en, this message translates to:
  /// **'Email notification'**
  String get emailNotification;

  /// No description provided for @sendEmailMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Allows to receive mails'**
  String get sendEmailMessageLabel;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @demoProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Demo profile'**
  String get demoProfileTitle;

  /// No description provided for @demoProfileTextFirst.
  ///
  /// In en, this message translates to:
  /// **'Now you have the option of replacing the content of your existing profile with a demo profile of your choice for promotional purposes, e.g. for demonstration on social media.'**
  String get demoProfileTextFirst;

  /// No description provided for @demoProfileTextImportant.
  ///
  /// In en, this message translates to:
  /// **'Important:'**
  String get demoProfileTextImportant;

  /// No description provided for @demoProfileTextLast.
  ///
  /// In en, this message translates to:
  /// **'This will completely overwrite your current profile content. This includes the profile picture as well as all information (name, weight, illnesses, etc.) that you have previously entered.'**
  String get demoProfileTextLast;

  /// No description provided for @listOfDemoProfileText.
  ///
  /// In en, this message translates to:
  /// **'List of demo profiles'**
  String get listOfDemoProfileText;

  /// No description provided for @previewTitle.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get previewTitle;

  /// No description provided for @profileContinue.
  ///
  /// In en, this message translates to:
  /// **'Please select a profile and continue:'**
  String get profileContinue;

  /// No description provided for @confirmDemoTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm demo profile'**
  String get confirmDemoTitle;

  /// No description provided for @confirmDemoLabelText.
  ///
  /// In en, this message translates to:
  /// **'Please confirm that your current profile shall be overwritten by the demo profile'**
  String get confirmDemoLabelText;

  /// No description provided for @confirmText.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmText;

  /// No description provided for @cancelText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelText;

  /// No description provided for @resetProductTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset product to it’s \n delivery state'**
  String get resetProductTitle;

  /// No description provided for @resetProductFirstText.
  ///
  /// In en, this message translates to:
  /// **'You now have the option of resetting a HelpMee product to its factory settings.'**
  String get resetProductFirstText;

  /// No description provided for @resetProductInfoText.
  ///
  /// In en, this message translates to:
  /// **'Info:'**
  String get resetProductInfoText;

  /// No description provided for @resetProductLastText.
  ///
  /// In en, this message translates to:
  /// **'During the process, any profile that is still linked is unmapped and the activation date is removed.'**
  String get resetProductLastText;

  /// No description provided for @startLabel.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startLabel;

  /// No description provided for @productResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Product successfully reset'**
  String get productResetTitle;

  /// No description provided for @productResetDesc.
  ///
  /// In en, this message translates to:
  /// **'You now have the option of resetting another HelpMee product to the delivery status or ending the process by tapping on the upper part of the screen.'**
  String get productResetDesc;

  /// No description provided for @restAnotherTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset another product'**
  String get restAnotherTitle;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get profileSettings;

  /// No description provided for @editPersonalAndMedicalData.
  ///
  /// In en, this message translates to:
  /// **'Edit personal and medical data'**
  String get editPersonalAndMedicalData;

  /// No description provided for @protectProfileItemWithPin.
  ///
  /// In en, this message translates to:
  /// **'Protect profile items via PIN'**
  String get protectProfileItemWithPin;

  /// No description provided for @protectProfileFirstText.
  ///
  /// In en, this message translates to:
  /// **'Secure your sensitive information by setting up your PIN code.'**
  String get protectProfileFirstText;

  /// No description provided for @protectProfileLastText.
  ///
  /// In en, this message translates to:
  /// **'You can decide for each element whether it should be PIN protected by closing the lock symbol.'**
  String get protectProfileLastText;

  /// No description provided for @managePIN.
  ///
  /// In en, this message translates to:
  /// **'Manage PIN'**
  String get managePIN;

  /// No description provided for @cooperationPartnersLabel.
  ///
  /// In en, this message translates to:
  /// **'Cooperation Partners'**
  String get cooperationPartnersLabel;

  /// No description provided for @cooperationPartnersFirstLabel.
  ///
  /// In en, this message translates to:
  /// **'Enjoy a variety of Cooperation Partners working together with HelpMee to make the life more safe.'**
  String get cooperationPartnersFirstLabel;

  /// No description provided for @cooperationPartnersLastLabel.
  ///
  /// In en, this message translates to:
  /// **'You can let the Cooperation Partner’s service being shown in your HelpMee profile to offer their service in an emergency case.'**
  String get cooperationPartnersLastLabel;

  /// No description provided for @checkCooperationPartners.
  ///
  /// In en, this message translates to:
  /// **'Check out the Cooperation Partners'**
  String get checkCooperationPartners;

  /// No description provided for @congratulationsMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulationsMessage;

  /// No description provided for @productActivated.
  ///
  /// In en, this message translates to:
  /// **'The product and your time period have been successfully activated!'**
  String get productActivated;

  /// No description provided for @firstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstNameLabel;

  /// No description provided for @lastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastNameLabel;

  /// No description provided for @enterNamePrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get enterNamePrompt;

  /// No description provided for @setPIN.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get setPIN;

  /// No description provided for @updatePIN.
  ///
  /// In en, this message translates to:
  /// **'Update PIN'**
  String get updatePIN;

  /// No description provided for @set.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get set;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @setPinDescription.
  ///
  /// In en, this message translates to:
  /// **'Secure profile items you locked by setting up your PIN code'**
  String get setPinDescription;

  /// No description provided for @updatePinDescription.
  ///
  /// In en, this message translates to:
  /// **'Secure profile items you locked by setting up your PIN code'**
  String get updatePinDescription;

  /// No description provided for @pinReminderTextOptional.
  ///
  /// In en, this message translates to:
  /// **'PIN reminder text (optional)'**
  String get pinReminderTextOptional;

  /// No description provided for @didntReceiveCodePrompt.
  ///
  /// In en, this message translates to:
  /// **'Didn’t receive 6 digit code?'**
  String get didntReceiveCodePrompt;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @privacyPolicyLink.
  ///
  /// In en, this message translates to:
  /// **'https://help-mee.com/pages/privacy-policy-addmee-app'**
  String get privacyPolicyLink;

  /// No description provided for @termsAndConditionsLink.
  ///
  /// In en, this message translates to:
  /// **'https://help-mee.com/pages/terms-and-conditions'**
  String get termsAndConditionsLink;

  /// No description provided for @generalServerError.
  ///
  /// In en, this message translates to:
  /// **'Server error, please try again'**
  String get generalServerError;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @enterConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter confirmation password'**
  String get enterConfirmPassword;

  /// No description provided for @errorAcceptPrivacyPolicyEULA.
  ///
  /// In en, this message translates to:
  /// **'You must accept the Privacy Policy & End User Licence Agreement to proceed.'**
  String get errorAcceptPrivacyPolicyEULA;

  /// No description provided for @confirmDeletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm deletion'**
  String get confirmDeletion;

  /// No description provided for @deleteAccountPopupDescriptionChild.
  ///
  /// In en, this message translates to:
  /// **'By pressing the confirm button you will permanently delete your account. Afterwards you won\'t be able to reactivate your account or retrieve any of the information you\'ve added. As this is a sub-profile, the main profile will remain.'**
  String get deleteAccountPopupDescriptionChild;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPasswordLabel;

  /// No description provided for @currentPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPasswordLabel;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderLabel;

  /// No description provided for @heightCm.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get heightCm;

  /// No description provided for @weightKg.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightKg;

  /// No description provided for @bloodGroup.
  ///
  /// In en, this message translates to:
  /// **'Blood group'**
  String get bloodGroup;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @enterDOB.
  ///
  /// In en, this message translates to:
  /// **'Enter date of birth'**
  String get enterDOB;

  /// No description provided for @addImportantNote.
  ///
  /// In en, this message translates to:
  /// **'Add an important text note...'**
  String get addImportantNote;

  /// No description provided for @important.
  ///
  /// In en, this message translates to:
  /// **'Important'**
  String get important;

  /// No description provided for @emergencyContacts.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get emergencyContacts;

  /// No description provided for @doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @medicalInformation.
  ///
  /// In en, this message translates to:
  /// **'Medical Information'**
  String get medicalInformation;

  /// No description provided for @picturesAndDocuments.
  ///
  /// In en, this message translates to:
  /// **'Pictures and documents'**
  String get picturesAndDocuments;

  /// No description provided for @addPicturesAndDocuments.
  ///
  /// In en, this message translates to:
  /// **'Add pictures & documents'**
  String get addPicturesAndDocuments;

  /// No description provided for @addPicturesORDocuments.
  ///
  /// In en, this message translates to:
  /// **'Add picture / document'**
  String get addPicturesORDocuments;

  /// No description provided for @insuranceInformation.
  ///
  /// In en, this message translates to:
  /// **'Insurance information'**
  String get insuranceInformation;

  /// No description provided for @insuranceCompany.
  ///
  /// In en, this message translates to:
  /// **'Insurance company'**
  String get insuranceCompany;

  /// No description provided for @insuranceID.
  ///
  /// In en, this message translates to:
  /// **'Insurance ID'**
  String get insuranceID;

  /// No description provided for @selectedDateOlderThanCurrentDate.
  ///
  /// In en, this message translates to:
  /// **'Selected date is older than current date'**
  String get selectedDateOlderThanCurrentDate;

  /// No description provided for @writeDetailsHere.
  ///
  /// In en, this message translates to:
  /// **'Write your details here'**
  String get writeDetailsHere;

  /// No description provided for @doYouHaveAllergies.
  ///
  /// In en, this message translates to:
  /// **'Do you have allergies? \n Then please enter the details in the field below.'**
  String get doYouHaveAllergies;

  /// No description provided for @doYouSufferFromInfectiousDiseases.
  ///
  /// In en, this message translates to:
  /// **'Do you suffer from infectious diseases? \n Then please enter the details in the field below.'**
  String get doYouSufferFromInfectiousDiseases;

  /// No description provided for @yesSufferingFromCoagulationDisorders.
  ///
  /// In en, this message translates to:
  /// **'Yes, I’m suffering from coagulation disorders'**
  String get yesSufferingFromCoagulationDisorders;

  /// No description provided for @yesUsingPacemakerOrDefibrillator.
  ///
  /// In en, this message translates to:
  /// **'Yes, I use a pacemaker or defibrillator'**
  String get yesUsingPacemakerOrDefibrillator;

  /// No description provided for @haveYouHadHeartAttacks.
  ///
  /// In en, this message translates to:
  /// **'Have you had one or more heart attacks? \n Then please enter the details in the field below.'**
  String get haveYouHadHeartAttacks;

  /// No description provided for @doYouSufferFromDiabetes.
  ///
  /// In en, this message translates to:
  /// **'Do you suffer from diabetes? \n Then please enter the details in the field below.'**
  String get doYouSufferFromDiabetes;

  /// No description provided for @yesOnDialysis.
  ///
  /// In en, this message translates to:
  /// **'Yes, I am on dialysis'**
  String get yesOnDialysis;

  /// No description provided for @yesSufferingFromAsthmaOrCOPD.
  ///
  /// In en, this message translates to:
  /// **'Yes, I suffer from asthma or COPD'**
  String get yesSufferingFromAsthmaOrCOPD;

  /// No description provided for @yesSufferingFromSeizureDisorder.
  ///
  /// In en, this message translates to:
  /// **'Yes, I suffer from seizure disorder (like epilepsy)'**
  String get yesSufferingFromSeizureDisorder;

  /// No description provided for @doYouHaveMentalIllness.
  ///
  /// In en, this message translates to:
  /// **'Do you have a mental illness? \n Then please enter the details in the field below.'**
  String get doYouHaveMentalIllness;

  /// No description provided for @doYouHaveOtherIllnesses.
  ///
  /// In en, this message translates to:
  /// **'Do you have any other illnesses or conditions? \n Then please enter the details in the field below.'**
  String get doYouHaveOtherIllnesses;

  /// No description provided for @fileName.
  ///
  /// In en, this message translates to:
  /// **'File name'**
  String get fileName;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @chooseFileType.
  ///
  /// In en, this message translates to:
  /// **'Choose file type'**
  String get chooseFileType;

  /// No description provided for @photoFromLibrary.
  ///
  /// In en, this message translates to:
  /// **'Photo from library'**
  String get photoFromLibrary;

  /// No description provided for @photoFromCamera.
  ///
  /// In en, this message translates to:
  /// **'Photo from camera'**
  String get photoFromCamera;

  /// No description provided for @document.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get document;

  /// No description provided for @cameraNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Camera not available'**
  String get cameraNotAvailable;

  /// No description provided for @cameraNotAvailableOnDevice.
  ///
  /// In en, this message translates to:
  /// **'The camera is not available on this device'**
  String get cameraNotAvailableOnDevice;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderPreferNotSay.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get genderPreferNotSay;

  /// No description provided for @genderCustom.
  ///
  /// In en, this message translates to:
  /// **'Diverse'**
  String get genderCustom;

  /// No description provided for @uploadImageOrDocument.
  ///
  /// In en, this message translates to:
  /// **'Upload image / document'**
  String get uploadImageOrDocument;

  /// No description provided for @recentNotifications.
  ///
  /// In en, this message translates to:
  /// **'Recent notifications'**
  String get recentNotifications;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get addProduct;

  /// No description provided for @productDescription.
  ///
  /// In en, this message translates to:
  /// **'Product description'**
  String get productDescription;

  /// No description provided for @uploadImportantDocuments.
  ///
  /// In en, this message translates to:
  /// **'Upload all important documents here: \n Vaccination card, heart card, allergy passport, other.'**
  String get uploadImportantDocuments;

  /// No description provided for @backButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButtonTitle;

  /// No description provided for @deactivateService.
  ///
  /// In en, this message translates to:
  /// **'Deactivate service'**
  String get deactivateService;

  /// No description provided for @updateDoctorContact.
  ///
  /// In en, this message translates to:
  /// **'Update Doctor'**
  String get updateDoctorContact;

  /// No description provided for @updateContact.
  ///
  /// In en, this message translates to:
  /// **'Update Contact'**
  String get updateContact;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @race.
  ///
  /// In en, this message translates to:
  /// **'Race'**
  String get race;

  /// No description provided for @character.
  ///
  /// In en, this message translates to:
  /// **'Character'**
  String get character;

  /// No description provided for @characteristics.
  ///
  /// In en, this message translates to:
  /// **'Characteristics'**
  String get characteristics;

  /// No description provided for @identification.
  ///
  /// In en, this message translates to:
  /// **'Identification'**
  String get identification;

  /// No description provided for @chipped.
  ///
  /// In en, this message translates to:
  /// **'Chipped'**
  String get chipped;

  /// No description provided for @tassoNumber.
  ///
  /// In en, this message translates to:
  /// **'Tasso no.'**
  String get tassoNumber;

  /// No description provided for @chipLocation.
  ///
  /// In en, this message translates to:
  /// **'Chip position'**
  String get chipLocation;

  /// No description provided for @taxNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax no.'**
  String get taxNumber;

  /// No description provided for @specialFeatures.
  ///
  /// In en, this message translates to:
  /// **' Special features'**
  String get specialFeatures;

  /// No description provided for @connectivityError.
  ///
  /// In en, this message translates to:
  /// **'Connection lost. Please check your internet connection and try again.'**
  String get connectivityError;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get accountSettings;

  /// No description provided for @recordAudio.
  ///
  /// In en, this message translates to:
  /// **'Record voice'**
  String get recordAudio;

  /// No description provided for @contactsTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contactsTabTitle;

  /// No description provided for @addContactButton.
  ///
  /// In en, this message translates to:
  /// **'Add contact'**
  String get addContactButton;

  /// No description provided for @emergencySubTitle.
  ///
  /// In en, this message translates to:
  /// **'In an emergency, a first aider can send their location to you to navigate there.'**
  String get emergencySubTitle;

  /// No description provided for @locationSetting.
  ///
  /// In en, this message translates to:
  /// **'Location settings'**
  String get locationSetting;

  /// No description provided for @addMedicationInformationButton.
  ///
  /// In en, this message translates to:
  /// **'Add medical information'**
  String get addMedicationInformationButton;

  /// No description provided for @addMedicationPlanButton.
  ///
  /// In en, this message translates to:
  /// **'Add medication plan'**
  String get addMedicationPlanButton;

  /// No description provided for @medicationPlanLabel.
  ///
  /// In en, this message translates to:
  /// **'Medication plan'**
  String get medicationPlanLabel;

  /// No description provided for @recordAudioDetail.
  ///
  /// In en, this message translates to:
  /// **'Here you can save a voice recording of up to 15sec that can be played back in an emergency. \n\n Examples \n Instructions for the first aider or a reassuring, familiar voice for the person in distress.'**
  String get recordAudioDetail;

  /// No description provided for @createNewContact.
  ///
  /// In en, this message translates to:
  /// **'Create new contact'**
  String get createNewContact;

  /// No description provided for @createNewContactDetail.
  ///
  /// In en, this message translates to:
  /// **'Add the details below to create a new contact'**
  String get createNewContactDetail;

  /// No description provided for @contactNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Name'**
  String get contactNameLabel;

  /// No description provided for @whatsappNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp number (optional)'**
  String get whatsappNumberLabel;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumberLabel;

  /// No description provided for @registerNewDoctor.
  ///
  /// In en, this message translates to:
  /// **'Register new doctor'**
  String get registerNewDoctor;

  /// No description provided for @registerNewDoctorDetail.
  ///
  /// In en, this message translates to:
  /// **'Provide the information below to register your doctor.'**
  String get registerNewDoctorDetail;

  /// No description provided for @doctorNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Doctor Name'**
  String get doctorNameLabel;

  /// No description provided for @doctorConsentVerification.
  ///
  /// In en, this message translates to:
  /// **'I have received the consent of my doctor to publish the contact details in my profile'**
  String get doctorConsentVerification;

  /// No description provided for @contactConsentVerification.
  ///
  /// In en, this message translates to:
  /// **'I have received the consent of this contact to publish the contact details in my profile'**
  String get contactConsentVerification;

  /// No description provided for @diseaseInformationConsent.
  ///
  /// In en, this message translates to:
  /// **'I agree that this information is accessible to all persons who have access to my HelpMee profile. I have the choice to protect this information with a PIN code after saving it.'**
  String get diseaseInformationConsent;

  /// No description provided for @addDoctorButton.
  ///
  /// In en, this message translates to:
  /// **'Add doctor'**
  String get addDoctorButton;

  /// No description provided for @locationSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here you can decide how you want to be notified when a first aider sends their location to you.'**
  String get locationSettingSubtitle;

  /// No description provided for @sendsEmail.
  ///
  /// In en, this message translates to:
  /// **'Sends you an email'**
  String get sendsEmail;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get addAddress;

  /// No description provided for @addressDescription.
  ///
  /// In en, this message translates to:
  /// **'Address description'**
  String get addressDescription;

  /// No description provided for @uploadPictureOrDocumentDetail.
  ///
  /// In en, this message translates to:
  /// **'Here you can upload a picture or a PDF document to be displayed in your HelpMee profile.'**
  String get uploadPictureOrDocumentDetail;

  /// No description provided for @uploadPictureOrDocumentExamples.
  ///
  /// In en, this message translates to:
  /// **'Vaccination card, organ donor card, living will, doctor\'s letters, ...'**
  String get uploadPictureOrDocumentExamples;

  /// No description provided for @examplesLabel.
  ///
  /// In en, this message translates to:
  /// **'Examples'**
  String get examplesLabel;

  /// No description provided for @uploadDocumentButton.
  ///
  /// In en, this message translates to:
  /// **'Upload document'**
  String get uploadDocumentButton;

  /// No description provided for @uploadPdfDocumentDetail.
  ///
  /// In en, this message translates to:
  /// **'Here you can upload a PDF document to be displayed in your HelpMee profile'**
  String get uploadPdfDocumentDetail;

  /// No description provided for @uploadPdfDocumentExamples.
  ///
  /// In en, this message translates to:
  /// **'Vaccination card, organ donor card, living will, doctor\'s letters, ...'**
  String get uploadPdfDocumentExamples;

  /// No description provided for @streetNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Street name'**
  String get streetNameLabel;

  /// No description provided for @houseNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'House number'**
  String get houseNumberLabel;

  /// No description provided for @zipLabel.
  ///
  /// In en, this message translates to:
  /// **'ZIP (optional)'**
  String get zipLabel;

  /// No description provided for @cityLabel.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get cityLabel;

  /// No description provided for @countryLabel.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryLabel;

  /// No description provided for @selectDateTitel.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get selectDateTitel;

  /// No description provided for @selectDatebtnTtitle.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectDatebtnTtitle;

  /// No description provided for @myProductsTitle.
  ///
  /// In en, this message translates to:
  /// **'My products'**
  String get myProductsTitle;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product name:'**
  String get productName;

  /// No description provided for @productType.
  ///
  /// In en, this message translates to:
  /// **'Product type:'**
  String get productType;

  /// No description provided for @serialNumber.
  ///
  /// In en, this message translates to:
  /// **'Serial number:'**
  String get serialNumber;

  /// No description provided for @activationDate.
  ///
  /// In en, this message translates to:
  /// **'Activation date:'**
  String get activationDate;

  /// No description provided for @expirationDatee.
  ///
  /// In en, this message translates to:
  /// **'Expiration date:'**
  String get expirationDatee;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
