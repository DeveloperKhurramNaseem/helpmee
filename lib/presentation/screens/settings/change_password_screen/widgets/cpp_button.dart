import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/change_password/change_password_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class CppButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CppButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: AppSize.instance.width * 0.58,
            child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
              builder: (context, state) {
                return AppButton(
                  onPressed: onPressed,
                  gradient: Theme.of(
                    context,
                  ).extension<AppGradients>()?.primaryButton,
                  child: Builder(
                    builder: (context) {
                      if (state is ChangePasswordLoadingState) {
                        return CupertinoActivityIndicator(
                          color: Colors.white,
                          radius: 10,
                        );
                      }
                      return Text(
                        AppLocalizations.of(context)!.changePasswordButton,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
