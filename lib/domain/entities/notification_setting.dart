
class NotificationSetting {
  bool isPushNotificationAllowed;
  bool isEmailNotificationAllowed;
  bool inAppNotificationAllowed;
  NotificationSetting({
    required this.isPushNotificationAllowed,
    required this.isEmailNotificationAllowed,
    required this.inAppNotificationAllowed,
  });

  factory NotificationSetting.empty() {
    return NotificationSetting(
      isPushNotificationAllowed: false,
      isEmailNotificationAllowed: false,
      inAppNotificationAllowed: false,
    );
  }
}
