import 'package:flutter/material.dart';
import 'package:help_mee/util/common_widgets/app_auth_button.dart';

class SIScreenButton extends StatelessWidget {
  const SIScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: AppAuthButton(
        onPressed: () {},
        child: Text(
          'Log in',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}
