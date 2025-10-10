import 'package:flutter/material.dart';
import 'package:help_mee/domain/entities/notification_data.dart';
import 'package:help_mee/presentation/screens/home/home_screen/widgets/hs_notification_list.dart';

class RecentNotificationsList extends StatelessWidget {
  final List<NotificationData> notifications;
  const RecentNotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList.builder(itemCount: notifications.length,itemBuilder: (context,index){
        return NotificationTile(isRecent: true, notification: notifications[index],);
      }),
    );
  }
}


class OldNotificationsList extends StatelessWidget {
  final List<NotificationData> notifications;
  const OldNotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList.builder(itemCount: notifications.length,itemBuilder: (context,index){
        return NotificationTile(notification: notifications[index],);
      }),
    );
  }
}