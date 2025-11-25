import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/home/get_user_profile/get_user_profile_bloc.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/get_products/get_products_bloc.dart';
import 'package:help_mee/presentation/screens/home/dashboard/widgets/dashboard_bottom_bar.dart';
import 'package:help_mee/presentation/screens/home/dashboard/widgets/names_sheet.dart';
import 'package:help_mee/presentation/screens/home/home_screen/home_screen.dart';
import 'package:help_mee/presentation/screens/home/notifications_screen/notification_screen.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/products_screen.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

class Dashboard extends StatefulWidget {
  static const path = '/';
  final bool showNameSheet;
  final bool callProfile;
  const Dashboard({super.key, required this.showNameSheet, required this.callProfile});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    log(
      sl<StorageService>().getUser().toMap().toString(),
      name: 'User Information',
    );    
    context.read<LatestNotificationsBloc>().add(GetLatestNotificationsEvent());
    context.read<AllNotificationsBloc>().add(GetAllNotificationsEvent());
    context.read<GetProductsBloc>().add(GetAllProductsEvent());
    if(widget.callProfile){
      context.read<GetUserProfileBloc>().add(GetUserProfileEvent());
    }        
    if (widget.showNameSheet) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        m.showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return PopScope(
              canPop: false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: NamesSheet(),
              ),
            );
          },
        );
      });
    }
  }

  @override
  void didUpdateWidget (Dashboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.showNameSheet != widget.showNameSheet){
      SchedulerBinding.instance.addPostFrameCallback((_) {
        m.showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return PopScope(
              canPop: false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: NamesSheet(),
              ),
            );
          },
        );
      });
    }        
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
