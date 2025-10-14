import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';

class EcTimerAndResend extends StatelessWidget {
  final Duration duration;
  const EcTimerAndResend({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    var seconds = duration.inSeconds.remainder(60);
    var minutes = duration.inMinutes;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColoredBox(
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
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
