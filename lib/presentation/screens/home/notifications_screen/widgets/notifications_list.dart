import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/home/home_screen/widgets/hs_notification_list.dart';

class RecentNotificationsList extends StatelessWidget {
  const RecentNotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList.builder(itemCount: 2,itemBuilder: (context,index){
        return NotificationTile(isRecent: true,);
      }),
    );
  }
}


class OldNotificationsList extends StatelessWidget {
  const OldNotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList.builder(itemCount: 2,itemBuilder: (context,index){
        return NotificationTile();
      }),
    );
  }
}