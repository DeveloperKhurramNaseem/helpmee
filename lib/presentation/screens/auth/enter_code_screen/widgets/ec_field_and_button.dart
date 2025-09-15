import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/create_password_screen.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_fields_row.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class EcFieldAndButton extends StatelessWidget {
  const EcFieldAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.only(top: 5.0), child: EcFieldsRow()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: AppSize.instance.width * 0.58,
            child: AppButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreatePasswordScreen()));
              },
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()?.primaryButton,
              child: Text(
                'Verify',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
