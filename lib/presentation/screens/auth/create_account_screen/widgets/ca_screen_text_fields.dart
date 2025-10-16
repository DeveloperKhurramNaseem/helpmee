import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/validations/email_validation.dart';

class CAScreenTextEmailField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  const CAScreenTextEmailField({
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
          if(value!.isEmpty){
            return localization.enterEmail;
          } else if(!isValidEmail(value)){
            return localization.errorInvalidEmail;
          }
          return null;
        },
        decoration: InputDecoration(
          border: TextFieldsConstants.border,
          labelText: AppLocalizations.of(context)!.emailLabel,
          helperText: '',
          errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
          focusedBorder: TextFieldsConstants.border,
          labelStyle: labelStyle,
        ),
        cursorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class CAScreenTextPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  const CAScreenTextPasswordField({
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: StatefulBuilder(
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
              errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
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
      ),
    );
  }
}

class CAScreenTextConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  const CAScreenTextConfirmPasswordField({
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
              ? AppLocalizations.of(context)!.enterConfirmPassword
              : null,
          decoration: InputDecoration(
            border: TextFieldsConstants.border,
            labelText: AppLocalizations.of(context)!.confirmPasswordLabel,
            helperText: '',
            errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
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
