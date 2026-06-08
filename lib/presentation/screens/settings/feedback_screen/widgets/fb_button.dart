import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/feedback/feedback_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class FbButton extends StatelessWidget {
  final void Function() onPressed;
  const FbButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: BlocBuilder<FeedbackBloc, FeedbackState>(
            builder: (context, state) {
              return AppButton(
                onPressed: state is FeedbackLoadingState ? null : onPressed,
                gradient: Theme.of(
                  context,
                ).extension<AppGradients>()?.primaryButton,
                child: state is FeedbackLoadingState
                    ? CupertinoActivityIndicator(color: Colors.white)
                    : Builder(
                        builder: (context) {
                          return Text(
                            AppLocalizations.of(context)!.sendButton,
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
      ],
    );
  }
}
