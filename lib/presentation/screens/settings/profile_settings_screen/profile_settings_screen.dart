import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_cooperation_partners.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_header.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_pin_card.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PsAppBar(),
      body: Center(
        child: CustomScrollView(
          slivers: [PsHeader(), PsPinCard(), PsCooperationPartners()],
        ),
      ),
    );
  }
}
