import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/home/home_screen/widgets/hs_recent_notification_text.dart';
import 'package:help_mee/presentation/screens/home/notifications_screen/widgets/notification_app_bar.dart';
import 'package:help_mee/presentation/screens/home/notifications_screen/widgets/notifications_list.dart';
import 'package:help_mee/util/constants/app_size.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: AppSize.instance.height * 0.01),
          ),
          NotificationsText(text: 'Recent Notifications'),
          RecentNotificationsList(),
          NotificationsText(text: 'Last 7 days'),
          OldNotificationsList(),
        ],
      ),
    );
  }
}
