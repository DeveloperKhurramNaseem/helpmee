import 'package:help_mee/data/models/app_user_model.dart';
import 'package:help_mee/data/models/cooperation_partners.dart';
import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/data/models/notification_setting_model.dart';
import 'package:help_mee/data/models/pin_data_model.dart';
import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';

class UserService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, List<NotificationModel>)> getNotifications(
    String token,
    String language,
  ) async {
    var result = await get(
      endPoint: EndPoints.latestNotifications,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        (decodedResponse.data['notifications'] as List).map((e) {
          return NotificationModel.fromJson(e);
        }).toList(),
      );
    }
    return (false, <NotificationModel>[]);
  }

  Future<
    (
      bool,
      ({
        List<NotificationModel> recentNotifications,
        List<NotificationModel> oldNotifications,
      }),
    )
  >
  getAllNotifications(String token, String language) async {
    var result = await get(
      endPoint: EndPoints.allNotifications,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        (
          recentNotifications:
              (decodedResponse.data['today_notifications'] as List)
                  .map((e) => NotificationModel.fromJson(e))
                  .toList(),
          oldNotifications:
              (decodedResponse.data['Seven_days_notifications'] as List)
                  .map((e) => NotificationModel.fromJson(e))
                  .toList(),
        ),
      );
    }
    return (
      false,
      (
        recentNotifications: <NotificationModel>[],
        oldNotifications: <NotificationModel>[],
      ),
    );
  }

  Future<(bool, String)> activateProduct(
    String code,
    String device,
    String token,
    String language,
  ) async {
    var result = await post(
      EndPoints.activateProduct,
      {'code': code, 'device': device},
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, NotificationSettingModel)> getNotificationSetting(
    String token,
    String language,
  ) async {
    var result = await get(
      endPoint: EndPoints.notificationSettings,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        NotificationSettingModel.fromMap(
          decodedResponse.data['generalNotificationSetting'],
        ),
      );
    }
    return (false, NotificationSettingModel.empty());
  }

  Future<(bool, String)> updateNotificationSetting(
    String token,
    NotificationSettingModel setting,
    String language,
  ) async {
    var result = await post(
      EndPoints.notificationSettingsChange,
      setting.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String, AppUserModel)> setNewPin(
    String token,
    PinDataModel pinData,
    String language,
  ) async {
    var result = await post(
      EndPoints.setNewPin,
      pinData.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponseWithMessagesList(result);
      if (decodedResponse.success) {
        var user = AppUserModel.fromMap(decodedResponse.data['user']);
        return (
          decodedResponse.success,
          decodedResponse.message.firstOrNull ?? '',
          user,
        );
      } else {
        (
          decodedResponse.success,
          decodedResponse.message.firstOrNull ?? '',
          AppUserModel(),
        );
      }
    }
    return (false, ErrorConstants.errorMessage, AppUserModel());
  }

  Future<(bool, String, AppUserModel)> updatePin(
    String token,
    PinDataModel pinData,
    String language,
  ) async {
    var result = await post(
      EndPoints.updatePin,
      pinData.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponseWithMessagesList(result);
      if (decodedResponse.success) {
        var user = AppUserModel.fromMap(decodedResponse.data['user']);
        return (
          decodedResponse.success,
          decodedResponse.message.firstOrNull ?? '',
          user,
        );
      } else {
        (
          decodedResponse.success,
          decodedResponse.message.firstOrNull ?? '',
          AppUserModel(),
        );
      }
    }
    return (false, ErrorConstants.errorMessage, AppUserModel());
  }

  Future<(bool, String)> deleteAccount(String token, String language) async {
    var result = await delete(
      EndPoints.deleteAccount,
      body: {"reason": "Delete Account"},
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String)> changePassword(
    String currentPassword,
    String newPassword,
    String token,
    String language,
  ) async {
    var result = await post(EndPoints.changePassword, {
      "current_password": currentPassword,
      "new_password": newPassword,
    }, header: NetworkConstants.getHeaders(language, token));
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String, List<CooperationPartner>)> getCooperationPartners(
    String token,
    String language,
  ) async {
    var result = await get(
      endPoint: EndPoints.getCooperationPartners,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,
        (decodedResponse.data as List)
            .map((e) => CooperationPartner.fromMap(e))
            .toList(),
      );
    }
    return (false, ErrorConstants.errorMessage, <CooperationPartner>[]);
  }

  Future<(bool, String)> updateCooperationPartnerStatus(
    String token,
    String language,
    int id,
    String isActive,
  ) async {
    var body = {"id": id, "is_active": isActive};

    var result = await post(
      EndPoints.activateCooperationPartners,
      body,
      header: NetworkConstants.getHeaders(language, token),
    );

    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String)> restoreProduct(
    String token,
    String language,
    String code,
  ) async {
    var body = {"device": code};

    var result = await post(
      EndPoints.restoreDevice,
      body,
      header: NetworkConstants.getHeaders(language, token),
    );

    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }
}
