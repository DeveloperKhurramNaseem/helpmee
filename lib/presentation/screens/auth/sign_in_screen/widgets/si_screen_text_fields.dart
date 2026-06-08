import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/validations/email_validation.dart';

class SIScreenTextEmailField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  const SIScreenTextEmailField({
    super.key,
    required this.controller,
    required this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 14,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      child: TextFormField(
        key: fieldKey,
        controller: controller,
        validator: (value) {
          var localization = AppLocalizations.of(context)!;
          if (value!.isEmpty) {
            return localization.enterEmail;
          } else if (!isValidEmail(value)) {
            return localization.errorInvalidEmail;
          }
          return null;
        },
        decoration: InputDecoration(
          border: TextFieldsConstants.border,
          labelText: AppLocalizations.of(context)!.emailLabel,
          helperText: '',
          focusedBorder: TextFieldsConstants.border,
          labelStyle: labelStyle,
        ),
        cursorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class SIScreenTextPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  const SIScreenTextPasswordField({
    super.key,
    required this.controller,
    required this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 14,
    );
    var isObscure = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          key: fieldKey,
          controller: controller,
          validator: (value) => value!.isEmpty
              ? AppLocalizations.of(context)!.enterPassword
              : null,
          decoration: InputDecoration(
            border: TextFieldsConstants.border,
            labelText: AppLocalizations.of(context)!.passwordLabel,
            helperText: '',
            focusedBorder: TextFieldsConstants.border,
            labelStyle: labelStyle,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => isObscure = !isObscure),
              child: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).colorScheme.secondary.withAlpha(100),
              ),
            ),
          ),
          obscureText: isObscure,
          // obscuringCharacter: TextFieldsConstants.obscuringCharacter,
          cursorColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}
