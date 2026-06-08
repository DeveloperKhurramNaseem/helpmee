import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';

class FbFields extends StatelessWidget {
  final TextEditingController firstNameController,
      lastNameController,
      emailController,
      phoneNoController,
      subjectController,
      messageController;
  final GlobalKey<FormFieldState> firstNameKey,
      lastNameKey,
      emailKey,
      phoneNoKey,
      subjectKey,
      messageKey;
  const FbFields({
    super.key,
    required this.firstNameController,
    required this.firstNameKey,
    required this.lastNameController,
    required this.lastNameKey,
    required this.emailController,
    required this.emailKey,
    required this.phoneNoController,
    required this.phoneNoKey,
    required this.subjectController,
    required this.subjectKey,
    required this.messageController,
    required this.messageKey,
  });

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Column(
      spacing: 5,
      children: [
        FbTextField(
          controller: firstNameController,
          fieldKey: firstNameKey,
          label: localization.firstNameLabel,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return localization.enterFirstName;
            }
            return null;
          },
        ),        
        FbTextField(
          controller: lastNameController,
          fieldKey: lastNameKey,
          label: localization.lastNameLabel,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return localization.enterLastName;
            }
            return null;
          },
        ),
        FbTextField(
          controller: emailController,
          fieldKey: emailKey,
          label: localization.emailLabel,
        ),
        FbTextField(
          controller: phoneNoController,
          fieldKey: phoneNoKey,
          label: localization.phoneNumberLabel,
        ),
        FbTextField(
          controller: subjectController,
          fieldKey: subjectKey,
          label: localization.subjectLabel,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return localization.enterSubject;
            }
            return null;
          },
        ),
        FbTextField(
          controller: messageController,
          fieldKey: messageKey,
          label: localization.messageLabel,          
          maxLines: 6,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return localization.enterMessage;
            }
            return null;
          },
        ),
      ],
    );
  }
}

class FbTextField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  final String label;
  final int maxLines;
  final String? Function(String?)? validator;
  const FbTextField({
    super.key,
    required this.controller,
    required this.fieldKey,
    this.label = '',
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.45),
      fontSize: 14,
    );
    return StatefulBuilder(
      builder: (context, setState) {
        return ColoredBox(
          color: Colors.transparent,
          child: TextFormField(
            controller: controller,
            key: fieldKey,
            validator: validator,
            decoration: InputDecoration(
              border: TextFieldsConstants.filledBorder,
              fillColor: Color.fromRGBO(238, 238, 238, 1),
              focusColor: Color.fromRGBO(238, 238, 238, 1),
              filled: true,
              isDense: true,
              enabledBorder: TextFieldsConstants.filledBorder,
              hintText: label.isEmpty ? 'Label here' : label,
              focusedBorder: TextFieldsConstants.border,
              hintStyle: labelStyle,
              helperText: '',
              helperStyle: TextStyle(height: 0.5),
            ),
            cursorColor: Theme.of(context).colorScheme.secondary,
            maxLines: maxLines,
          ),
        );
      },
    );
  }
}
