import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/presentation/screens/settings/app_settings_screen/settings_screen.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var logo = sl<StorageService>().getUser().logo;
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: Stack(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.logoBarImage,
                    height: kToolbarHeight * 0.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(SettingsScreen.path);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.5,
                        ),
                        // image: DecorationImage(
                        //   image: AssetImage(AppImages.placeHolderPerson),
                        // ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        foregroundImage: logo != null
                            ? CachedNetworkImageProvider(logo)
                            : AssetImage(AppImages.placeHolderPerson),
                        backgroundImage: AssetImage(
                          AppImages.placeHolderPerson,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppSize.instance.width, kToolbarHeight);
}
