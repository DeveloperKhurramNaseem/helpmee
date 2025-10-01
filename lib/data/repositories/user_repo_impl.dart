import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/data/source/user_service.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/repositories/user_repo.dart';

class UserRepoImpl extends UserRepo{
  final UserService userService;
  UserRepoImpl(this.userService);
  @override
  Future<(bool,List<NotificationData>)> getLatestNotifications(){
    return userService.getNotifications();      
  }

  @override
  Future<(bool, ({List<NotificationModel> oldNotifications, List<NotificationModel> recentNotifications}))> getAllNotifications() {
    return userService.getAllNotifications();
  }

  
}