import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:help_mee/presentation/screens/onboarding/product_map_bottom_sheet/product_map_bottom_sheet.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

class AddAccountBottomSheet extends StatefulWidget {
  const AddAccountBottomSheet({super.key});

  @override
  State<AddAccountBottomSheet> createState() => _AddAccountBottomSheetState();
}

class _AddAccountBottomSheetState extends State<AddAccountBottomSheet> {
  bool updated = false;

  clearDataAndLogOut() {
    sl<StorageService>().clearData();
    context.go(SignInScreen.path);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.addAccountButton,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: AppButton(
              onPressed: () {
                if (updated) {
                  Navigator.of(context).pop();
                  m.showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    isScrollControlled: true,
                    enableDrag: false,
                    showDragHandle: true,
                    builder: (context) {
                      return PopScope(
                        canPop: false,
                        child: ProductMapBottomSheet(
                          token: '',
                          makeChildWithExistingEmail: true,
                        ),
                      );
                    },
                  );
                } else {
                  clearDataAndLogOut();
                }
              },
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()!.primaryButton,
              child: Text(
                updated
                    ? AppLocalizations.of(context)!.createWithExistingEmail
                    : AppLocalizations.of(context)!.signInToExistingAccount,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              24.0,
              8.0,
              24.0,
              Platform.isAndroid ? 12 : 8,
            ),
            child: AppButtonOutlined(
              onPressed: () {
                if (updated) {
                  clearDataAndLogOut();
                } else {
                  setState(() {
                    updated = true;
                  });
                }
              },
              child: Text(
                updated
                    ? AppLocalizations.of(context)!.createWithNewEmail
                    : AppLocalizations.of(context)!.createNewAccountButton,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
