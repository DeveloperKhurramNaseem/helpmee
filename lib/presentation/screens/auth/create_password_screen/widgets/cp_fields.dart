import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';

class CpFields extends StatelessWidget {
  final TextEditingController passwordController,
      confirmationPasswordController;
  final GlobalKey<FormFieldState> passwordKey, confirmationPasswordKey;
  const CpFields({
    super.key,
    required this.passwordController,
    required this.confirmationPasswordController,
    required this.passwordKey,
    required this.confirmationPasswordKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CpPasswordField(controller: passwordController, fieldKey: passwordKey),
        CpConfirmPasswordField(
          controller: confirmationPasswordController,
          fieldKey: confirmationPasswordKey,
        ),
      ],
    );
  }
}

class CpPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  final String label;
  const CpPasswordField({
    super.key,
    required this.controller,
    required this.fieldKey,
    this.label = '',
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
          controller: controller,
          key: fieldKey,
          decoration: InputDecoration(
            border: TextFieldsConstants.border,
            labelText: label.isEmpty ? AppLocalizations.of(context)!.passwordLabel : label,
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
          cursorColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}

class CpConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  const CpConfirmPasswordField({
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
          controller: controller,
          key: fieldKey,
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
          cursorColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}
