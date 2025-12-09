import 'dart:convert';
import 'dart:developer';

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
import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  Future<(bool, String)> editProductName(
    String productName,
    String productId,
    String token,
    String language,
  ) async {
    var result = await post(
      EndPoints.updateProductName,
      {"device_name": productName, "device_id": productId},
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

  Future<(bool, String, List<ProductModel>)> getProductsList(
    String token,
    String language,
  ) async {
    var result = await get(
      endPoint: EndPoints.productsList,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,
        (decodedResponse.data['devices'] as List)
            .map((e) => ProductModel.fromMap(e))
            .toList(),
      );
    }
    return (false, ErrorConstants.errorMessage, <ProductModel>[]);
  }

  Future<(bool, String)> unmapProduct(
    String token,
    String language,
    String prodcutCode,
  ) async {
    var body = {"device": prodcutCode};

    var result = await post(
      EndPoints.unmapProduct,
      body,
      header: NetworkConstants.getHeaders(language, token),
    );

    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String)> deleteVoice(String token, String language) async {
    var result = await delete(
      EndPoints.deleteVoice,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String)> updateLocationSharingSetting(
    String token,
    String language,
    bool sharing,
  ) async {
    var result = await post(
      EndPoints.locationSharingSetting,
      {'location_sharing': '$sharing'},
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String, List<DemoProfileModel>)> getDemoProfiles(
    String token,
    String language,
  ) async {
    var result = await get(
      endPoint: EndPoints.getDemoProfiles,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,
        (decodedResponse.data['users'] as List)
            .map((e) => DemoProfileModel.fromMap(e))
            .toList(),
      );
    }
    return (false, ErrorConstants.errorMessage, <DemoProfileModel>[]);
  }

  Future<(bool, String, AppUserModel?)> transferData(
    String token,
    String language,
    String userName,
  ) async {
    var result = await post(EndPoints.transferData, {
      'username': userName,
    }, header: NetworkConstants.getHeaders(language, token));
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,
        AppUserModel.fromMap(decodedResponse.data),
      );
    }
    return (false, ErrorConstants.errorMessage, null);
  }

  Future<(bool, AppDataModel)> getUserProfile(
    String token,
    String language,
  ) async {
    var result = await get(
      endPoint: EndPoints.userProfile,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      log('User data : ${decodedResponse.data}');
      return (
        decodedResponse.success,
        AppDataModel.fromMap(decodedResponse.data),
      );
    }
    return (false, AppDataModel(user: AppUserModel()));
  }

  Future<SigninResponse> switchAccount(
    int accountId,
    String token,
    String lang,
  ) async {
    var result = await post(EndPoints.switchAccount, {
      'id': accountId.toString(),
    }, header: NetworkConstants.getHeaders(lang, token));
    if (result != null) {
      log(result, name: 'Switch Account response');
      final decodedResponse = jsonDecode(result);
      return SigninResponse.fromMap(decodedResponse);
    }
    return SigninResponse.empty(ErrorConstants.errorMessage);
  }

  Future<SigninResponse> makeChildWithExistingEmail(
    String code,
    String token,
    String lang,
  ) async {
    var result = await post(
      EndPoints.makeChildWithExistingEmail,
      {'code': code},
      header: NetworkConstants.getHeaders(lang, token),
    );
    if (result != null) {
      final decodedResponse = jsonDecode(result);
      return SigninResponse.fromMap(decodedResponse);
    }
    return SigninResponse.empty(ErrorConstants.errorMessage);
  }

  Future<(bool, String)> sendFeedbackAndroid(
    String token,
    String language,
    FeedbackInfo feedbackInfo,
    PackageInfo packageInfo,
    AndroidDeviceInfo androidDeviceInfo,    
  ) async {
    log(androidDeviceInfo.data.toString(), name: 'Android Info');
    
    var result = await post(EndPoints.sendFeedback, {
      ...feedbackInfo.toJson(),
      'addmee_version': packageInfo.version,
      'device_name_version': 
          '${androidDeviceInfo.name} ${androidDeviceInfo.version.release}',          
      'device': androidDeviceInfo.brand,          
      'os': 'Android'
    }, header: NetworkConstants.getHeaders(language, token));
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool, String)> sendFeedbackIos(
    String token,
    String language,
    FeedbackInfo feedbackInfo,
    PackageInfo packageInfo,    
    IosDeviceInfo iosDeviceInfo,
  ) async {
    log(iosDeviceInfo.data.toString(), name: 'iOS Info');
    var result = await post(EndPoints.sendFeedback, {
      ...feedbackInfo.toJson(),
      'addmee_version': packageInfo.version,
      'device_name_version':'${iosDeviceInfo.modelName} ${iosDeviceInfo.systemVersion}',
      'device': iosDeviceInfo.model,
      'os': 'iOS',
    }, header: NetworkConstants.getHeaders(language, token));
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);
  }

  Future<(bool,String)> deleteProfileAndMakeChildParent(String token, String lang) async{
    var result = await delete(
      EndPoints.deleteProfileAndMakeChildParent,
      header: NetworkConstants.getHeaders(lang, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (decodedResponse.success, decodedResponse.message);
    }
    return (false, ErrorConstants.errorMessage);    
  }
  
}
