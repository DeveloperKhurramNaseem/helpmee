import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/auth/signup/signup_bloc.dart';

import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class CAScreenButton extends StatelessWidget {
  final void Function() onPressed;
  const CAScreenButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var gradients = Theme.of(context).extension<AppGradients>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return AppButton(
            onPressed: onPressed,
            gradient: gradients?.primaryButton,
            child: Builder(
              builder: (context) {
                if (state is SignupLoadingState) {
                  return CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 10,
                  );
                }
                return Text(
                  AppLocalizations.of(context)!.signUpTitle,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
