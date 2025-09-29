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
  /// **'Sign Up'**
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
  /// **'Enter code'**
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
