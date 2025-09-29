import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';

class CAScreenTextEmailField extends StatelessWidget {
  const CAScreenTextEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 14,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: TextFormField(
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

class CAScreenTextPasswordField extends StatelessWidget {
  const CAScreenTextPasswordField({super.key});

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
          obscuringCharacter: TextFieldsConstants.obscuringCharacter,
          cursorColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}

class CAScreenTextConfirmPasswordField extends StatelessWidget {
  const CAScreenTextConfirmPasswordField({super.key});

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
          decoration: InputDecoration(
            border: TextFieldsConstants.border,
            labelText: AppLocalizations.of(context)!.confirmPasswordLabel,
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
          obscuringCharacter: TextFieldsConstants.obscuringCharacter,
          cursorColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}
