import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_base_tile.dart';
import 'package:help_mee/presentation/screens/settings/settings_screen/widgets/settings_header.dart';
import 'package:help_mee/util/constants/icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(),
      body: CustomScrollView(
        slivers: [
          SettingsHeader(),
          SettingsBaseTile(
            titleText: 'Products & Profiles',
            image: AppIcons.plusSelected,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Products & Profiles',
            image: AppIcons.plusSelected,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Products & Profiles',
            image: AppIcons.plusSelected,
            onTap: () {},
          ),
          SettingsBaseTile(
            titleText: 'Products & Profiles',
            image: AppIcons.plusSelected,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
