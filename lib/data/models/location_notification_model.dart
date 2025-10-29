class LocationNotificationModel {


  static const pushNotificationKey = 'push_notification' , emailNotificationKey = 'email_newsletter' , inAppNotificationKey = 'inapp_notification' , emailHelpMeeNotificationKey = 'email_helpmee_notification' ;

  bool pushNotification;
  bool emailNotification;
  bool inAppNotification;
  bool emailHelpMeeNotification;


  LocationNotificationModel({required this.pushNotification ,required this.emailNotification , required this.inAppNotification , required this.emailHelpMeeNotification});

  factory LocationNotificationModel.fromMap(Map<String, dynamic> json) {
    return LocationNotificationModel(
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

  factory LocationNotificationModel.empty(){    
    return LocationNotificationModel(
      pushNotification: false,
      emailNotification: false,
      inAppNotification: false,
      emailHelpMeeNotification: false,
    );
  }


}

