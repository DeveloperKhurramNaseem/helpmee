class NotificationUserModel {

  static const idKey = 'id' , userIdKey = 'user_id', nameKey = 'name', emailKey = 'email', createdAtKey = 'created_at', updatedAtKey = 'updated_at';

  int id;
  int userId;
  String name;
  String email;
  String createdAt;
  String updatedAt;

  NotificationUserModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationUserModel.fromMap(Map<String, dynamic> map) {
    return NotificationUserModel(
      id: map[idKey] ?? 0,
      userId: map[userIdKey] ?? 0,
      name: map[nameKey] ?? '',
      email: map[emailKey] ?? '',
      createdAt: map[createdAtKey] ?? '',
      updatedAt: map[updatedAtKey] ?? '',
    );
  }
}