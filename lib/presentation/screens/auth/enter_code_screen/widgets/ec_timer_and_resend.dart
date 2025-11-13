import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/auth/resend_otp/resend_otp_bloc.dart';

class EcTimerAndResend extends StatelessWidget {
  final Duration duration;
  final String email;
  const EcTimerAndResend({
    super.key,
    required this.duration,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    var seconds = duration.inSeconds.remainder(60);
    var minutes = duration.inMinutes;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ColoredBox(
            color: Colors.transparent,
            child: Column(
              spacing: 18,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (duration.inSeconds != 0)
                  Text(
                    '${minutes == 0 ? '00' : '$minutes'}:${seconds < 10 ? '0$seconds' : '$seconds'}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                else
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${AppLocalizations.of(context)!.didntReceiveCodePrompt} ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(
                              context,
                            ).colorScheme.secondary.withAlpha(150),
                          ),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.resendCode,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.read<ResendOtpBloc>().add(
                                ResendOtpNowEvent(email),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
