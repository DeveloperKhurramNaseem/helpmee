import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
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
      body: BlocBuilder<AllNotificationsBloc, AllNotificationsState>(
        builder: (context, state) {
          if(state is AllNotificationsLoadingState){
            return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary,),);
          }else if(state is AllNotificationsErrorState){
            return Center(child: Text(state.message),);
          }else if(state is AllNotificationsLoadedState){
            return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: AppSize.instance.height * 0.01),
              ),
              if(state.recentNotifications.isNotEmpty)
              NotificationsText(
                text: AppLocalizations.of(context)!.recentNotificationsLabel,
              ),
              RecentNotificationsList(notifications: state.recentNotifications),
              if(state.oldNotificationsList.isNotEmpty)
              NotificationsText(text: 'Last 7 days'),
              OldNotificationsList(notifications: state.oldNotificationsList),
            ],
          );            
          } 
          return SizedBox();
        },
      ),
    );
  }
}
