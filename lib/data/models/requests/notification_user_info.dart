class NotificationUserInfo {

  static const nameKey = 'name' , emailKey = 'email';

  String name;
  String email;

  NotificationUserInfo({required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {
      nameKey: name,
      emailKey: email,
    };
  }

}