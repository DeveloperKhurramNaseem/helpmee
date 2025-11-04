import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class AppGenderDropdownButton extends StatelessWidget {
  final String label;
  final int initialValue;
  final List<int> items;
  final void Function(int?) onChanged;
  const AppGenderDropdownButton({super.key , required this.label, required this.initialValue, required this.items , required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppLightThemeColors.textfieldBorderColor),
        color: AppLightThemeColors.textfieldColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2<int>(
          value: initialValue,
          isExpanded: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
            labelText: label,
          ),
          items: items
              .map(
                (e) => DropdownMenuItem<int>(
                  value: e,
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      switch (e) {
                        1 => localization.genderMale,
                        2 => localization.genderFemale,
                        3 => localization.genderPreferNotSay,
                        _ => localization.genderCustom,
                      },
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          buttonStyleData: const ButtonStyleData(
            width: double.infinity,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          menuItemStyleData: const MenuItemStyleData(height: 40),
        ),
      ),
    );
  }
}

class AppDropdownButton extends StatelessWidget {
  final String label;
  final String initialValue;
  final List<String> items;
  final void Function(String?) onChanged;
  const AppDropdownButton({super.key , required this.label, required this.initialValue, required this.items , required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppLightThemeColors.textfieldBorderColor),
        color: AppLightThemeColors.textfieldColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2<String>(
          value: initialValue,
          isExpanded: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
            labelText: label,
          ),
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: SizedBox(
                    width: 200,
                    child: Text(
                     e,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          buttonStyleData: const ButtonStyleData(
            width: double.infinity,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          menuItemStyleData: const MenuItemStyleData(height: 40),
        ),
      ),
    );
  }
}