import 'package:help_mee/data/models/location_notification_model.dart';
import 'package:help_mee/data/models/requests/notification_user_info.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/data/source/user_location_notification_service.dart';
import 'package:help_mee/domain/repositories/user_location_notification_repo.dart';

class UserLocationNotificationRepoImpl extends UserLocationNotificationRepo {
  final UserLocationNotificationService userLocationNotificationService;
  final TokenService tokenService;
  final StorageService storageService;

  UserLocationNotificationRepoImpl(
    this.userLocationNotificationService,
    this.tokenService,
    this.storageService,
  );

  @override
  Future<(bool, String, LocationNotificationModel)>
  getUserLocationNotificationSettings() async {
    var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    return userLocationNotificationService.getLocationNotificationSettings(
      token,
      language,
    );
  }

  @override
  Future<(bool, String, LocationNotificationModel)>
  updateLocationNotificationSettings(
    LocationNotificationModel locationNotificationModel,
  ) async {
    var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    return userLocationNotificationService.updateLocationNotificationSettings(
      token,
      language,
      locationNotificationModel,
    );
  }

  @override
  Future<(bool, String)> addNotificationUser(
    NotificationUserInfo userInfo,
  ) async {
    var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    return userLocationNotificationService.addNotificationUser(
      token,
      language,
      userInfo,
    );
  }

  @override
  Future<(bool, String)> updateNotificationUser(
    int notificationUserId,
    NotificationUserInfo userInfo,
  ) async {
    var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    return userLocationNotificationService.updateNotificationUser(
      token,
      language,
      notificationUserId,
      userInfo,
    );
  }

  @override
  Future<(bool, String)> deleteNotificationUser(int notificationUserId) async {
    var token = await tokenService.getToken();
    var language = storageService.getLanguage();
    return userLocationNotificationService.deleteNotificationUser(
      token,
      language,
      notificationUserId,
    );
  }
}
