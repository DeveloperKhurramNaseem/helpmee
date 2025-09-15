import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/onboarding/product_map_bottom_sheet/product_map_bottom_sheet.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class SIScreenButton extends StatelessWidget {
  const SIScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
      child: AppButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,          
            builder: (context) {
              return ProductMapBottomSheet();
            },
          );
        },
        gradient: Theme.of(context).extension<AppGradients>()?.primaryButton,
        child: Text(
          'Sign in',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}
