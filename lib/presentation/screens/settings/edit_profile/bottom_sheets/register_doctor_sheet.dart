import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class RegisterDoctorSheet extends StatelessWidget {
  const RegisterDoctorSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localization.createNewContact,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localization.createNewContactDetail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppLightThemeColors.secondaryTextColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
            child: EpHeaderInfoBaseField(
              label: localization.contactNameLabel,
              controller: TextEditingController()..text = 'Khuram Naseem',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
            child: EpHeaderInfoBasePhoneNoField(
              label: localization.phoneNumberLabel,
              controller: TextEditingController(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
            child: EpHeaderInfoBasePhoneNoField(
              label: localization.whatsappNumberLabel,
              controller: TextEditingController(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(width: 0.2),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Theme.of(context).colorScheme.primary;
                    }
                    return Colors.transparent;
                  }),
                  checkColor: Colors.white,
                  overlayColor: WidgetStatePropertyAll(Colors.white),
                ),
                Expanded(
                  child: Text(
                    localization.contactConsentVerification,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
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
        ],
      ),
    );
  }
}
