import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/get_cooperation_partners_bloc/get_cooperation_partners_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/set_pin_bloc/set_pin_bloc.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_app_bar.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_cooperation_partners.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_header.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/widgets/ps_pin_card.dart';
import 'package:help_mee/util/common_widgets/show_toast.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetCooperationPartnersBloc>().add(
      GetAllCooperationPartnersEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetPinBloc, SetPinState>(
      listener: _setPinBlocListener,
      child: Scaffold(
        appBar: PsAppBar(),
        body: Center(
          child: CustomScrollView(
            slivers: [PsHeader(), PsPinCard(), PsCooperationPartners()],
          ),
        ),
      ),
    );
  }

  void _setPinBlocListener(BuildContext context, SetPinState state) {
    if (state is SetPinDoneState) {
      Navigator.of(context).pop();
      context.read<LatestNotificationsBloc>().add(
        GetLatestNotificationsEvent(isLoading: false),
      );
      context.read<AllNotificationsBloc>().add(
        GetAllNotificationsEvent(isLoading: false),
      );
    } else if (state is SetPinErrorState) {
      showToast(state.message);
      Navigator.of(context).pop();
    }
  }
}
