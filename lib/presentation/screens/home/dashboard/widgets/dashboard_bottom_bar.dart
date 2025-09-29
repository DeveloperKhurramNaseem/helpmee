import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';

class DashboardBottomBar extends StatelessWidget {
  final void Function(int) onTap;
  final int selectedIndex;
  const DashboardBottomBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.instance.height * 0.09,
      width: AppSize.instance.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFE1E1E1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 30,
              child: GestureDetector(
                onTap: () => onTap(0),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: DashboardBottomBarIcon(
                    title: AppLocalizations.of(context)!.homeLabel,
                    isSelected: selectedIndex == 0,
                    selectedIcon: AppIcons.homeSelected,
                    icon: AppIcons.home,
                  ),
                ),
              ),
            ),
            VerticalDivider(color: Colors.white, indent: 10, endIndent: 10),
            Expanded(
              flex: 30,
              child: GestureDetector(
                onTap: () => onTap(1),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: DashboardBottomBarIcon(
                    title: 'Profiles & Products',
                    isSelected: selectedIndex == 1,
                    selectedIcon: AppIcons.plusSelected,
                    icon: AppIcons.plus,
                  ),
                ),
              ),
            ),
            VerticalDivider(color: Colors.white, indent: 10, endIndent: 10),
            Expanded(
              flex: 30,
              child: GestureDetector(
                onTap: () => onTap(2),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: DashboardBottomBarIcon(
                    title: AppLocalizations.of(context)!.notificationsLabel,
                    isSelected: selectedIndex == 2,
                    selectedIcon: AppIcons.notificationSelected,
                    icon: AppIcons.notification,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardBottomBarIcon extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String selectedIcon, icon;
  const DashboardBottomBarIcon({
    super.key,
    required this.title,
    required this.isSelected,
    required this.selectedIcon,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 7,
      children: [
        SvgPicture.asset(
          isSelected ? selectedIcon : icon,
          height: 20,
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 9,
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Color.fromRGBO(0, 0, 0, 0.7),
          ),
        ),
      ],
    );
  }
}
