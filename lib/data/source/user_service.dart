import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/services/api_services/api_service.dart';
import 'package:help_mee/util/network/end_points.dart';
import 'package:help_mee/util/network/network_constants.dart';

class UserService extends ApiService {
  @override
  String get apiUrl => '/api/v3/users';

  Future<(bool, List<NotificationModel>)> getNotifications() async {
    var result = await get(endPoint: EndPoints.latestNotifications , header: {...NetworkConstants.headers , 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjgsImlhdCI6MTc1ODAyMzU1OCwiZXhwIjoxNzYwNjE1NTU4fQ.4KZk6wXwio6dEIO7RLVODYvcf11LY8eiCohf1VhrZmY'});
    if (result != null) {
      return (
        result.success,
        (result.data['notifications'] as List)
            .map((e) => NotificationModel.fromJson(e))
            .toList(),
      );
    }
    return (false, <NotificationModel>[]);
  }

  Future<(bool, ({List<NotificationModel> recentNotifications , List<NotificationModel> oldNotifications}))> getAllNotifications() async {
    var result = await get(endPoint: EndPoints.allNotifications , header: {...NetworkConstants.headers , 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjgsImlhdCI6MTc1ODAyMzU1OCwiZXhwIjoxNzYwNjE1NTU4fQ.4KZk6wXwio6dEIO7RLVODYvcf11LY8eiCohf1VhrZmY'});
    if (result != null) {
      return (
        result.success,
        (recentNotifications:  (result.data['today_notifications'] as List)
            .map((e) => NotificationModel.fromJson(e))
            .toList(),
            oldNotifications:
            (result.data['Seven_days_notifications'] as List)
            .map((e) => NotificationModel.fromJson(e))
            .toList(),)
      );
    }
    return (false, (recentNotifications: <NotificationModel>[], oldNotifications: <NotificationModel>[]));
  }

  Future<(bool,String)> activateProduct(String code,  String device, String token) async{
    var result = await post(EndPoints.activateProduct, {
      'code': code,
      'device': device,
    }, header: {'Authorization': 'Bearer $token',...NetworkConstants.headers});

    if(result != null){
      return (result.success , result.message);
    }

    return (false , 'Something went wrong');
  }
}
