import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/index.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class AddAddressSheet extends StatelessWidget {
  const AddAddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        left: 12,
        right: 12,
      ),
      child: SingleChildScrollView(
        child: Wrap(
          runSpacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add address',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            EpHeaderInfoBaseField(
              label: 'Address Description',
              controller: TextEditingController(),
            ),
            EpHeaderInfoBaseField(
              label: 'Street Name',
              controller: TextEditingController(),
            ),
            EpHeaderInfoBaseField(
              label: 'House Number',
              controller: TextEditingController(),
            ),
            EpHeaderInfoBaseField(
              label: 'ZIP',
              controller: TextEditingController(),
            ),
            EpHeaderInfoBaseField(
              label: 'City',
              controller: TextEditingController(),
            ),
            EpHeaderInfoBaseDropDownField(
              label: 'Germany',
              onChanged: (value) {},
              items: ['Germany', 'Pakistan'],
              trailing: Icon(Icons.keyboard_arrow_down_rounded),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: AppButton(
                onPressed: () {},
                gradient: Theme.of(
                  context,
                ).extension<AppGradients>()!.primaryButton,
                child: Text(
                  AppLocalizations.of(context)!.saveButton,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.viewInsetsOf(context).bottom),
          ],
        ),
      ),
    );
  }
}
