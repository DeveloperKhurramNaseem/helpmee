import 'package:flutter/material.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class AmSupportText extends StatelessWidget {
  const AmSupportText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'I can\'t activate my product and need ',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          TextSpan(
            text: 'support',
            style: TextStyle(color: AppLightThemeColors.blue),
          ),
        ],
      ),
    );
  }
}
