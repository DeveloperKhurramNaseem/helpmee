import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:intl/intl.dart';

class EpHeaderInfoBaseField extends StatelessWidget {
  final String label;
  final bool readOnly;
  final TextEditingController controller;
  final Widget? trailing;
  final String? hint;
  final TextStyle? hintStyle;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final TextInputType keyBoardType;

  const EpHeaderInfoBaseField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.trailing,
    this.hint,
    this.fontSize,
    this.padding,
    this.hintStyle,
    this.keyBoardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppLightThemeColors.textfieldBorderColor),
        color: AppLightThemeColors.textfieldColor,
      ),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        controller: controller,
        keyboardType: keyBoardType,
        readOnly: readOnly,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          labelText: label.isEmpty ? null : label,
          hintText: hint,
          hintStyle: hintStyle,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          floatingLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: trailing,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 22,
            maxWidth: 22,
            minHeight: 20,
            minWidth: 20,
          ),
        ),
      ),
    );
  }
}

class EpHeaderInfoBasePhoneNoField extends StatelessWidget {
  final String label;
  final bool readOnly;
  final TextEditingController controller;
  final Widget? trailing;
  final String initialCode;
  final void Function(CountryCode)? onChanged;

  const EpHeaderInfoBasePhoneNoField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.trailing,
    required this.initialCode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.instance.height * 0.067,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppLightThemeColors.textfieldBorderColor),
        color: AppLightThemeColors.textfieldColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 5.0, right: 5),
          //   child: Container(
          //     height: AppSize.instance.height * 0.065,
          //     width: AppSize.instance.width * 0.1,
          //     margin: EdgeInsets.all(5),
          //   ),
          // ),
          ColoredBox(
            color: Colors.transparent,
            child: CountryCodePicker(
              initialSelection: initialCode,              
              flagWidth: 20,
              textStyle: TextStyle(fontSize: 1),
              pickerStyle: PickerStyle.fullScreen,
              showFlag: true,
              onChanged: onChanged,
              showCountryOnly: false,
              hideMainText: true,
              showOnlyCountryWhenClosed: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              height: AppSize.instance.height * 0.065,
              child: VerticalDivider(
                color: Color.fromRGBO(237, 237, 237, 1),
                thickness: 1,
                width: 0,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              readOnly: readOnly,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              decoration: InputDecoration(
                hintText: label,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                ),
                border: InputBorder.none,
                suffixIcon: trailing,
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 22,
                  maxWidth: 22,
                  minHeight: 20,
                  minWidth: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EpHeaderInfoBaseDropDownField extends StatelessWidget {
  final String label;
  final Widget? trailing;
  final ValueChanged<int?> onChanged;
  final List<int> items;
  final int genderValue;

  const EpHeaderInfoBaseDropDownField({
    super.key,
    required this.genderValue,
    required this.label,
    this.trailing,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppLightThemeColors.textfieldBorderColor),
        color: AppLightThemeColors.textfieldColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: DropdownButtonFormField<int>(
        initialValue: genderValue,
        items: items
            .map(
              (e) => DropdownMenuItem<int>(
                value: e,
                child: Text(switch (e) {
                  1 => localization.genderMale,
                  2 => localization.genderFemale,
                  3 => localization.genderPreferNotSay,
                  _ => localization.genderCustom,
                }),
              ),
            )
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          floatingLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          border: InputBorder.none,
          suffixIcon: trailing,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 22,
            maxWidth: 22,
            minHeight: 20,
            minWidth: 20,
          ),
        ),
      ),
    );
  }
}

class EpHeaderInfoBaseDropDownStringField extends StatelessWidget {
  final String label;
  final Widget? trailing;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final String value;

  const EpHeaderInfoBaseDropDownStringField({
    super.key,
    required this.label,
    this.trailing,
    required this.onChanged,
    required this.items,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppLightThemeColors.textfieldBorderColor),
        color: AppLightThemeColors.textfieldColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        items: items
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          floatingLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          border: InputBorder.none,
          suffixIcon: trailing,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 22,
            maxWidth: 22,
            minHeight: 20,
            minWidth: 20,
          ),
        ),
      ),
    );
  }
}

class EpHeaderFirstAndLastName extends StatelessWidget {
  final TextEditingController firstNameController, lastNameController;
  const EpHeaderFirstAndLastName({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: EpHeaderInfoBaseField(
                label: AppLocalizations.of(context)!.firstNameLabel,
                controller: firstNameController,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EpHeaderInfoBaseField(
                label: AppLocalizations.of(context)!.lastNameLabel,
                controller: lastNameController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EpHeaderHeightAndWeight extends StatelessWidget {
  final TextEditingController heightController, weightController;
  const EpHeaderHeightAndWeight({
    super.key,
    required this.heightController,
    required this.weightController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: EpHeaderInfoBaseField(
                label: AppLocalizations.of(context)!.heightCm,
                keyBoardType: TextInputType.number,
                controller: heightController,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EpHeaderInfoBaseField(
                label: AppLocalizations.of(context)!.weightKg,
                keyBoardType: TextInputType.number,
                controller: weightController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EpHeaderGenderAndBirthday extends StatelessWidget {
  final TextEditingController birthdayController;
  final ValueChanged<int?> onGenderChanged;
  final int initialGenderValue;
  const EpHeaderGenderAndBirthday({
    super.key,
    required this.initialGenderValue,
    required this.onGenderChanged,
    required this.birthdayController,
  });

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: EpHeaderInfoBaseDropDownField(
              genderValue: initialGenderValue,
              items: TextFieldsConstants.genderValues,
              label: localization.genderLabel,
              onChanged: onGenderChanged,
              trailing: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: EpHeaderInfoBaseField(
              label: localization.birthday,
              readOnly: true,
              controller: birthdayController,
              trailing: GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(
                      Duration(days: 365 * 100),
                    ),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      birthdayController.text = DateFormat(
                        'MMMM dd, yyyy',
                      ).format(value);
                    }
                  });
                },
                child: SvgPicture.asset(AppIcons.calender),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EpHeaderBloodGroup extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final String initialValue;
  const EpHeaderBloodGroup({
    super.key,
    required this.onChanged,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: EpHeaderInfoBaseDropDownStringField(
              items: TextFieldsConstants.bloodGroupValues,
              label: AppLocalizations.of(context)!.bloodGroup,
              value: initialValue,
              onChanged: onChanged,
              trailing: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
