import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/data/models/notification_setting_model.dart';
import 'package:help_mee/data/models/pin_data_model.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/data/source/user_service.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/entities/notification_setting.dart';
import 'package:help_mee/domain/entities/pin_data.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final UserService userService;
  final TokenService tokenService;
  final StorageService storageService;
  UserRepoImpl(this.userService, this.tokenService, this.storageService);
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

}
