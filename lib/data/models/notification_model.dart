import 'package:help_mee/domain/entities/notification_data.dart';

class NotificationModel extends NotificationData {
  NotificationModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.type,
    required super.readStatus,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    super.deDescription,
    super.deTitle,
    super.description,
    super.link,
    super.phone,
    super.phoneNumber,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      readStatus: json['read_status'] as int,
      status: json['status'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] as String,    
      deDescription: json['de_description'] as String?,
      deTitle: json['de_title'] as String?,
      description: json['description'] as String?,
      link: json['link'] as String?,
      phone: json['phone'] as String?,
      phoneNumber: json['phone_number'] as String?,              
    );
  }
}
