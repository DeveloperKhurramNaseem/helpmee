
import 'package:help_mee/data/models/app_data_model.dart';
import 'package:help_mee/data/models/cooperation_partners.dart';
import 'package:help_mee/data/models/demo_profile_model.dart';
import 'package:help_mee/data/models/notification_model.dart';
import 'package:help_mee/data/models/product_model.dart';
import 'package:help_mee/data/models/requests/feedback_info.dart';
import 'package:help_mee/data/models/signin_response.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/domain/entities/notification_setting.dart';
import 'package:help_mee/domain/entities/pin_data.dart';

abstract class UserRepo {
  Future<(bool, List<NotificationData>)> getLatestNotifications();
  Future<
    (
      bool,
      ({
        List<NotificationModel> recentNotifications,
        List<NotificationModel> oldNotifications,
      }),
    )
  >
  getAllNotifications();
  Future<(bool, String)> activateProduct(
    String code,
    String device,
    String token,
  );
  Future<(bool, String)> addProduct(
    String code,
    String device,    
  );
  Future<(bool, NotificationSetting)> getNotificationSetting();
  Future<(bool, String)> updateNotificationSetting(NotificationSetting setting);
  Future<(bool, String)> setNewPin(PinData pinData);
  Future<(bool, String)> updatePin(PinData pinData);
  Future<(bool, String)> deleteAccount();
  Future<(bool, String)> changePassword(
    String currentPassword,
    String newPassword,
  );
  Future<(bool, String, List<CooperationPartner>)> getCooperationPartners();
  Future<(bool, String)> updateCooperationPartnerStatus(
    int id,
    String isActive,
  );
  Future<(bool, String)> restoreProduct(String code);
  Future<(bool, String, List<ProductModel>)> getProductsList();
  Future<(bool, String)> unmapProduct(String prodcutCode);
  Future<(bool,String)> editProductName(String productName, String productId);
  Future<(bool, String)> deleteVoice();
  Future<(bool, String)> updateLocationSharingSetting(bool value);
  Future<(bool,String,List<DemoProfileModel>)> getDemoProfiles();
  Future<(bool, String)> transferData(String userName);
  Future<(bool, AppDataModel)> getUserProfile();
  Future<SigninResponse> switchAccount(int accountId);
  Future<SigninResponse> makeChildWithExistingEmail(String code);
  Future<(bool, String)> sendFeedback(FeedbackInfo feedbackInfo);

}
