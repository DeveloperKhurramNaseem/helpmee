import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/enter_code_screen.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class FpFieldAndButton extends StatelessWidget {
  const FpFieldAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 14,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: AppSize.instance.width * 0.58,
            child: AppButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => EnterCodeScreen()));
              },
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()?.primaryButton,
              child: Text(
                AppLocalizations.of(context)!.continueButton,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
