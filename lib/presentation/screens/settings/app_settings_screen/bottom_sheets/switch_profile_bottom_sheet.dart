import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/data/models/app_user_model.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/home/all_notifications/all_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/home/latest_notifications/latest_notifications_bloc.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/get_products/get_products_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/delete_profile_and_make_child_parent/delete_profile_and_make_child_parent_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/switch_account/switch_account_bloc.dart';
import 'package:help_mee/presentation/screens/home/dashboard/dashboard.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/bottom_sheets/add_account_bottom_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

class SwitchProfileBottomSheet extends StatelessWidget {
  const SwitchProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var childAccounts = sl<StorageService>().getChildAccounts();
    return BlocListener<SwitchAccountBloc, SwitchAccountState>(
      listener: _handleSwitchAccountBloc,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localization.switchAccountOrAddProfile,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              for (var child in childAccounts) ProfileTile(child: child),
              AddProfileTile(
                title: localization.addAccountButton,
                onTap: () {
                  Navigator.of(context).pop();
                  m.showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return AddAccountBottomSheet();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSwitchAccountBloc(
    BuildContext context,
    SwitchAccountState state,
  ) {
    if (state is SwitchAccountLoadedState) {
      context.pop();
      context.go(Dashboard.path, extra: [false, false]);
      context.read<LatestNotificationsBloc>().add(
        GetLatestNotificationsEvent(),
      );
      context.read<AllNotificationsBloc>().add(GetAllNotificationsEvent());
      context.read<GetProductsBloc>().add(GetAllProductsEvent());
    }
  }
}

class ProfileTile extends StatelessWidget {
  final AppUserModel child;
  const ProfileTile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SwitchAccountBloc>().add(
          SwitchIntoNewAccountEvent(child.id ?? 0),
        );
      },
      child: Container(
        height: AppSize.instance.height * 0.065,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 0.55),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
        ),
        margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: child.logo == null || child.logo!.isEmpty
                  ? AssetImage(AppImages.placeHolderPerson)
                  : CachedNetworkImageProvider(child.logo!),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${child.firstName ?? ''} ${child.lastName ?? ''}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      child.email ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (child.id == sl<StorageService>().getUser().id)
              GestureDetector(
                onTap: () {
                  context.read<DeleteProfileAndMakeChildParentBloc>().add(DeleteProfileAndMakeChildParentEvent());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(AppIcons.del, width: 20, height: 20),
                ),
              ),
            if (child.id == sl<StorageService>().getUser().id)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 23,
              ),
          ],
        ),
      ),
    );
  }
}

class AddProfileTile extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const AddProfileTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.instance.height * 0.065,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 249, 249, 0.55),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
        ),
        margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                height: AppSize.instance.height * 0.065,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset(AppIcons.add, width: 30),
              ),
            ),
            SizedBox(
              height: AppSize.instance.height * 0.065,
              child: VerticalDivider(
                color: Color.fromRGBO(237, 237, 237, 1),
                thickness: 1,
                width: 0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
