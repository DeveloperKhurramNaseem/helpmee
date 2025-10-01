import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/screens/home/dashboard/widgets/dashboard_bottom_bar.dart';
import 'package:help_mee/presentation/screens/home/home_screen/home_screen.dart';
import 'package:help_mee/presentation/screens/home/notifications_screen/notification_screen.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/products_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  void initState() {    
    super.initState();
    context.read<LatestNotificationsBloc>().add(GetLatestNotificationsEvent());
    context.read<AllNotificationsBloc>().add(GetAllNotificationsEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                if (selectedIndex == 0) {
                  return HomeScreen();
                } else if (selectedIndex == 1) {
                  return ProductsScreen();
                }
                return NotificationScreen();
              },
            ),
            Align(
              alignment: Alignment(0, 0.95),
              child: DashboardBottomBar(
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
