import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class AddDiseaseSheet extends StatelessWidget {
  final String title;
  final String description;
  const AddDiseaseSheet({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
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
                  description,
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppLightThemeColors.textfieldBorderColor,
                ),
                color: AppLightThemeColors.textfieldColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextFormField(
                controller: TextEditingController(),
                maxLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your details here',
                  hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                ),
              ),
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
                    'I agree that this information is accessible to all persons who have access to my HelpMee profile. I have the choice to protect this information with a PIN code after saving it.',
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
