import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/app_size.dart';

class ProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;
  const ProductsAppBar({super.key, required this.showBack});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: showBack
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (showBack)
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                Text(
                  AppLocalizations.of(context)!.myProductsTitle,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                if (showBack)
                  Opacity(
                    opacity: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppSize.instance.width, kToolbarHeight);
}
