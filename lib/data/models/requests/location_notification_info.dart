class LocationNotificationInfo {


  static const pushNotificationKey = 'push_notification' , emailNotificationKey = 'email_newsletter' , inAppNotificationKey = 'inapp_notification' , emailHelpMeeNotificationKey = 'email_helpmee_notification';

  bool pushNotification;
  bool emailNotification;
  bool inAppNotification;
  bool emailHelpMeeNotification;
  


  LocationNotificationInfo({required this.pushNotification ,required this.emailNotification , required this.inAppNotification , required this.emailHelpMeeNotification});

  factory LocationNotificationInfo.fromMap(Map<String, dynamic> json) {
    return LocationNotificationInfo(
      pushNotification: json[pushNotificationKey] ?? false,
      emailNotification: json[emailNotificationKey] ?? false,
      inAppNotification: json[inAppNotificationKey] ?? false,
      emailHelpMeeNotification: json[emailHelpMeeNotificationKey] ?? false,      
    );
  }

  Map<String,dynamic> toMap(){
    return {
      pushNotificationKey: pushNotification,
      emailNotificationKey: emailNotification,
      inAppNotificationKey: inAppNotification,
      emailHelpMeeNotificationKey: emailHelpMeeNotification,
    };  
  }

  factory LocationNotificationInfo.empty(){    
    return LocationNotificationInfo(
      pushNotification: false,
      emailNotification: false,
      inAppNotification: false,
      emailHelpMeeNotification: false,      
    );
  }


}

