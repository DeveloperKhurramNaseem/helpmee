class NotificationData {
  int id;
  int userId;
  String title;
  String type;
  int readStatus;
  String? description;
  String? deTitle;
  String? link;
  String? deDescription;
  int status;
  String? phone;
  String? phoneNumber;
  DateTime createdAt;
  String updatedAt;

  NotificationData({
    required this.id,
    required this.userId,
    required this.title,
    required this.type,
    required this.readStatus,
    this.description,
    this.deTitle,
    this.link,
    this.deDescription,
    required this.status,
    this.phone,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });
}


