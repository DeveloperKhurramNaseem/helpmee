import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:help_mee/data/models/app_data_model.dart';
import 'package:help_mee/data/models/app_user_model.dart';
import 'package:help_mee/data/models/cooperation_partners.dart';
import 'package:help_mee/data/models/demo_profile_model.dart';
import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/data/models/notification_setting_model.dart';
import 'package:help_mee/data/models/pin_data_model.dart';
import 'package:help_mee/data/models/product_model.dart';
import 'package:help_mee/data/models/requests/feedback_info.dart';
import 'package:help_mee/data/models/signin_response.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/data/source/user_service.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/entities/notification_setting.dart';
import 'package:help_mee/domain/entities/pin_data.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UserRepoImpl extends UserRepo {
  final UserService userService;
  final TokenService tokenService;
  final StorageService storageService;
  final DeviceInfoPlugin deviceInfoPlugin;

  UserRepoImpl(
    this.userService,
    this.tokenService,
    this.storageService,
    this.deviceInfoPlugin,
  );
  @override
  Future<(bool, List<NotificationData>)> getLatestNotifications() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    var data = await userService.getNotifications(token, lang);
    if (lang == 'de') {
      return (
        data.$1,
        data.$2.map((e) {
          var notification = e;
          notification.title = notification.deTitle ?? notification.title;
          notification.deDescription =
              notification.deDescription ?? notification.description;
          return notification;
        }).toList(),
      );
    }
    return data;
  }

  @override
  Future<
    (
      bool,
      ({
        List<NotificationModel> oldNotifications,
        List<NotificationModel> recentNotifications,
      }),
    )
  >
  getAllNotifications() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    var data = await userService.getAllNotifications(token, lang);
    if (lang == 'de') {
      var oldNotifications = data.$2.oldNotifications.map((e) {
        var notification = e;
        notification.title = notification.deTitle ?? notification.title;
        notification.deDescription =
            notification.deDescription ?? notification.description;
        return notification;
      }).toList();
      var recentNotifications = data.$2.recentNotifications.map((e) {
        var notification = e;
        notification.title = notification.deTitle ?? notification.title;
        notification.deDescription =
            notification.deDescription ?? notification.description;
        return notification;
      }).toList();
      return (
        data.$1,
        (
          oldNotifications: oldNotifications,
          recentNotifications: recentNotifications,
        ),
      );
    }
    return data;
  }

  @override
  Future<(bool, String)> activateProduct(
    String code,
    String device,
    String token,
  ) async {
    var lang = storageService.getLanguage();
    var result = await userService.activateProduct(code, device, token, lang);
    await tokenService.saveToken(token);
    return result;
  }

  @override
  Future<(bool, NotificationSetting)> getNotificationSetting() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    return userService.getNotificationSetting(token, lang);
  }

  @override
  Future<(bool, String)> updateNotificationSetting(
    NotificationSetting setting,
  ) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    return userService.updateNotificationSetting(
      token,
      NotificationSettingModel.fromNotificationSetting(setting),
      lang,
    );
  }

  @override
  Future<(bool, String)> setNewPin(PinData pinData) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    var data = await userService.setNewPin(
      token,
      PinDataModel.fromPinData(pinData),
      lang,
    );
    if (data.$1) {
      var user = storageService.getUser();
      storageService.saveUser(
        user.copyWith(
          pinCode: data.$3.pinCode,
          pinCodeReminderText: data.$3.pinCodeReminderText,
        ),
      );
    }
    return (data.$1, data.$2);
  }

  @override
  Future<(bool, String)> updatePin(PinData pinData) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    var data = await userService.updatePin(
      token,
      PinDataModel.fromPinData(pinData),
      lang,
    );
    if (data.$1) {
      var user = storageService.getUser();
      storageService.saveUser(
        user.copyWith(
          pinCode: data.$3.pinCode,
          pinCodeReminderText: data.$3.pinCodeReminderText,
        ),
      );
    }
    return (data.$1, data.$2);
  }

  @override
  Future<(bool, String)> deleteAccount() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    var data = await userService.deleteAccount(token, lang);
    return (data.$1, data.$2);
  }

  @override
  Future<(bool, String)> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    return userService.changePassword(
      currentPassword,
      newPassword,
      token,
      lang,
    );
  }

  @override
  Future<(bool, String, List<CooperationPartner>)>
  getCooperationPartners() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    return userService.getCooperationPartners(token, lang);
  }

  @override
  Future<(bool, String)> updateCooperationPartnerStatus(
    int id,
    String isActive,
  ) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    return await userService.updateCooperationPartnerStatus(
      token,
      lang,
      id,
      isActive,
    );
  }

  @override
  Future<(bool, String)> restoreProduct(String code) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    return await userService.restoreProduct(token, lang, code);
  }

  @override
  Future<(bool, String, List<ProductModel>)> getProductsList() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    return await userService.getProductsList(token, lang);
  }

  @override
  Future<(bool, String)> unmapProduct(String prodcutCode) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    return await userService.unmapProduct(token, lang, prodcutCode);
  }

  @override
  Future<(bool, String)> deleteVoice() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    return await userService.deleteVoice(token, lang);
  }

  @override
  Future<(bool, String)> updateLocationSharingSetting(bool value) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    return await userService.updateLocationSharingSetting(token, lang, value);
  }

  @override
  Future<(bool, String, List<DemoProfileModel>)> getDemoProfiles() async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    return await userService.getDemoProfiles(token, lang);
  }

  @override
  Future<(bool, String)> transferData(String userName) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();

    var result = await userService.transferData(token, lang, userName);
    if (result.$1) {
      if (result.$3 != null) {
        storageService.saveUser(result.$3!);
      }
    }
    return (result.$1, result.$2);
  }

  @override
  Future<(bool, String)> addProduct(String code, String device) async {
    var lang = storageService.getLanguage();
    var token = await tokenService.getToken();
    var result = await userService.activateProduct(code, device, token, lang);
    return result;
  }

  @override
  Future<(bool, String)> editProductName(
    String productName,
    String productId,
  ) async {
    var lang = storageService.getLanguage();
    var token = await tokenService.getToken();
    var result = await userService.editProductName(
      productName,
      productId,
      token,
      lang,
    );
    return result;
  }

  @override
  Future<(bool, AppDataModel)> getUserProfile() async {
    var lang = storageService.getLanguage();
    var token = await tokenService.getToken();
    var result = await userService.getUserProfile(token, lang);
    var user = storageService.getUser();
    var childAccounts = [
      user,
      ...(result.$2.childAccounts ?? <AppUserModel>[]),
    ];
    await storageService.saveChildAccounts(childAccounts);
    return result;
  }

  @override
  Future<SigninResponse> switchAccount(int accountId) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    var result = await userService.switchAccount(accountId, token, lang);
    await tokenService.saveToken(result.data.accessToken.accessToken);
    await storageService.saveUser(result.user);
    return result;
  }

  @override
  Future<SigninResponse> makeChildWithExistingEmail(String code) async {
    var token = await tokenService.getToken();
    var lang = storageService.getLanguage();
    var result = await userService.makeChildWithExistingEmail(
      code,
      token,
      lang,
    );
    await tokenService.saveToken(result.data.accessToken.accessToken);
    await storageService.saveUser(result.user);
    var childAccounts = [...(storageService.getChildAccounts()), result.user];
    await storageService.saveChildAccounts(childAccounts);
    return result;
  }

  @override
  Future<(bool, String)> sendFeedback(FeedbackInfo feedbackInfo) async {
    var lang = storageService.getLanguage();
    var token = await tokenService.getToken();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfoPlugin.androidInfo;
      var result = await userService.sendFeedbackAndroid(
        token,
        lang,
        feedbackInfo,
        packageInfo,
        androidInfo,
      );
      return result;
    }
    var iosInfo = await deviceInfoPlugin.iosInfo;
    var result = await userService.sendFeedbackIos(
      token,
      lang,
      feedbackInfo,
      packageInfo,
      iosInfo,
    );
    return result;
  }
}
