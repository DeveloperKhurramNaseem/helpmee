import 'package:help_mee/data/models/location_notification_model.dart';
import 'package:help_mee/data/models/requests/notification_user_info.dart';
import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/constants/error_constants.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';

class UserLocationNotificationService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, String, LocationNotificationModel)>
  getLocationNotificationSettings(String token, String language) async {
    var result = await get(
      endPoint: EndPoints.getLocationNotificationSettings,
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,
        LocationNotificationModel.fromMap(
          decodedResponse.data['notificationSetting'],
        ),
      );
    } else {
      return (
        false,
        ErrorConstants.errorMessage,
        LocationNotificationModel.empty(),
      );
    }
  }

  Future<(bool, String, LocationNotificationModel)>
  updateLocationNotificationSettings(
    String token,
    String language,
    LocationNotificationModel locationNotificationModel,
  ) async {
    var result = await post(
      EndPoints.getLocationNotificationSettings,
      locationNotificationModel.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,
        LocationNotificationModel.fromMap(
          decodedResponse.data['notifications'],
        ),
      );
    } else {
      return (
        false,
        ErrorConstants.errorMessage,
        LocationNotificationModel.empty(),
      );
    }
  }

  Future<(bool,String)> addNotificationUser( String token,
    String language,NotificationUserInfo userInfo)async{
    var result = await post(
      EndPoints.getLocationNotificationSettings,
      userInfo.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,        
      );
    } else {
      return (
        false,
        ErrorConstants.errorMessage,        
      );
    }    
  }

  Future<(bool,String)> updateNotificationUser( String token,
    String language, int notificationUserId ,NotificationUserInfo userInfo)async{
    var result = await put(
      '${EndPoints.updateNotificationUser}/$notificationUserId',
      userInfo.toMap(),
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,        
      );
    } else {
      return (
        false,
        ErrorConstants.errorMessage,        
      );
    }    
  }

    Future<(bool,String)> deleteNotificationUser( String token,
    String language, int notificationUserId)async{
    var result = await delete(
      '${EndPoints.deleteNotificationUser}/$notificationUserId',      
      header: NetworkConstants.getHeaders(language, token),
    );
    if (result != null) {
      final decodedResponse = decodeResponse(result);
      return (
        decodedResponse.success,
        decodedResponse.message,        
      );
    } else {
      return (
        false,
        ErrorConstants.errorMessage,        
      );
    }    
  }
}
