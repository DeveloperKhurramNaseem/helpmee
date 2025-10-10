import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/data/models/notification_setting_model.dart';
import 'package:help_mee/data/models/pin_data_model.dart';
import 'package:help_mee/data/source/token_service.dart';
import 'package:help_mee/data/source/user_service.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/entities/notification_setting.dart';
import 'package:help_mee/domain/entities/pin_data.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final UserService userService;
  final TokenService tokenService;
  UserRepoImpl(this.userService, this.tokenService);
  @override
  Future<(bool, List<NotificationData>)> getLatestNotifications() async {
    var token = await tokenService.getToken();
    return userService.getNotifications(token);
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
    return userService.getAllNotifications(token);
  }

  @override
  Future<(bool, String)> activateProduct(String code, String device) async {
    var token = await tokenService.getToken();
    return userService.activateProduct(code, device, token);
  }

  @override
  Future<(bool, NotificationSetting)> getNotificationSetting() async {
    var token = await tokenService.getToken();
    return userService.getNotificationSetting(token);
  }

  @override
  Future<(bool, String)> updateNotificationSetting(
    NotificationSetting setting,
  ) async {
    var token = await tokenService.getToken();
    return userService.updateNotificationSetting(
      token,
      NotificationSettingModel.fromNotificationSetting(setting),
    );
  }


  @override
  Future<(bool, String)> setNewPin(PinData pinData) async{
    var token = await tokenService.getToken();
    return userService.setNewPin(token, PinDataModel.fromPinData(pinData));    
  }
}
