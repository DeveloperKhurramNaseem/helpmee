import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/screens/home/home_screen/widgets/hs_app_bar.dart';
import 'package:help_mee/presentation/screens/home/home_screen/widgets/hs_loading_and_error_widgets.dart';
import 'package:help_mee/presentation/screens/home/home_screen/widgets/hs_notification_list.dart';
import 'package:help_mee/presentation/screens/home/home_screen/widgets/hs_recent_notification_text.dart';
import 'package:help_mee/util/constants/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: AppSize.instance.height * 0.03),
          ),
          NotificationsText(
            text: AppLocalizations.of(context)!.recentNotificationsLabel,
          ),
          BlocBuilder<LatestNotificationsBloc, LatestNotificationsState>(
            builder: (context, state) {
              if (state is LatestNotificationsLoadingState) {
                return HsLoadingWidget();
              } else if (state is LatestNotificationsErrorState) {
                return HsErrorWidget(message: state.message);
              } else if (state is LatestNotificationsLoadedState) {
                return HsNotificationList(notifications: state.notifications);
              }
              return SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
