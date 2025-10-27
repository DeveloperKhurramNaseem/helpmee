import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:intl/intl.dart';

class EpHeaderInfoBaseField extends StatelessWidget {
  final String label;
  final bool readOnly;
  final TextEditingController controller;
  final Widget? trailing;
  final String? hint;

  const EpHeaderInfoBaseField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.trailing,
    this.hint,
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
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
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

  const EpHeaderInfoBasePhoneNoField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.trailing,
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
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: Container(
              height: AppSize.instance.height * 0.065,
              width: AppSize.instance.width * 0.1,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: CountryCodePicker(
                initialSelection: 'IT',
                favorite: ['+39', 'FR'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
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
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
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
  final ValueChanged<String?> onChanged;
  final List<String> items;

  const EpHeaderInfoBaseDropDownField({
    super.key,
    required this.label,
    this.trailing,
    required this.onChanged,
    required this.items,
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
        initialValue: items.first,
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

                controller: heightController,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EpHeaderInfoBaseField(
                label: AppLocalizations.of(context)!.weightKg,

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
  final TextEditingController genderController, birthdayController;
  const EpHeaderGenderAndBirthday({
    super.key,
    required this.genderController,
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
              items: [localization.genderMale, localization.genderFemale],
              label: localization.genderLabel,
              onChanged: (value) {},
              trailing: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: EpHeaderInfoBaseField(
              label: localization.birthday,

              readOnly: true,
              controller: birthdayController
                ..text = DateFormat('MMMM dd, yyyy').format(DateTime.now()),
              trailing: GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(
                      Duration(days: 365 * 100),
                    ),
                    lastDate: DateTime.now(),
                  );
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
  const EpHeaderBloodGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: EpHeaderInfoBaseDropDownField(
              items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
              label: AppLocalizations.of(context)!.bloodGroup,
              onChanged: (value) {},
              trailing: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
