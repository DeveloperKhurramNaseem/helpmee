import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_fields.dart';

class CppFields extends StatelessWidget {
  final TextEditingController currentPasswordController,
      passwordController,
      confirmationPasswordController;
  final GlobalKey<FormFieldState> currentPasswordKey,
      passwordKey,
      confirmationPasswordKey;
  const CppFields({
    super.key,
    required this.currentPasswordController,
    required this.currentPasswordKey,
    required this.passwordController,
    required this.confirmationPasswordController,
    required this.passwordKey,
    required this.confirmationPasswordKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        CpPasswordField(
          controller: currentPasswordController,
          fieldKey: currentPasswordKey,
          label: AppLocalizations.of(context)!.currentPasswordLabel,
        ),
        CpPasswordField(
          controller: passwordController,
          fieldKey: passwordKey,
          label: AppLocalizations.of(context)!.newPasswordLabel,
        ),
        CpConfirmPasswordField(
          controller: confirmationPasswordController,
          fieldKey: confirmationPasswordKey,
        ),
      ],
    );
  }
}
