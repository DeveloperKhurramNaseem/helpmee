import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/auth/signin/signin_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class SIScreenButton extends StatelessWidget {
  final void Function() onPressed;
  const SIScreenButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
      child: AppButton(
        onPressed: onPressed,
        gradient: Theme.of(context).extension<AppGradients>()?.primaryButton,
        child: BlocBuilder<SigninBloc, SigninState>(
          builder: (context, state) {
            if (state is SigninLoadingState) {
                  return CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 10,
                  );
                }
            return Text(
              AppLocalizations.of(context)!.signInTitle,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            );
          },
        ),
      ),
    );
  }
}
