import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/util/constants/date_formatting.dart';
import 'package:help_mee/util/constants/images.dart';

class HsNotificationList extends StatelessWidget {
  final List<NotificationData> notifications;
  const HsNotificationList({super.key , required this.notifications});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationTile(notification: notifications[index],);
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final bool isRecent;
  final NotificationData notification;
  const NotificationTile({super.key, this.isRecent = false, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
          side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 1),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset(AppImages.logoBarImage),
          ),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 7.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Text(
                DateFormatting.formatDateForNotification(notification.createdAt),
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (isRecent)
                Icon(
                  Icons.circle,
                  size: 8.5,
                  color: Theme.of(context).colorScheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}


