import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/auth/signin/signin_bloc.dart';

class SIScreenLetsStart extends StatelessWidget {
  const SIScreenLetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.welcomeBackTitle,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    );
  }
}

class SIScreenCreateAccount extends StatelessWidget {
  const SIScreenCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.signInPrompt,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}

class SIScreenErrorText extends StatelessWidget {
  const SIScreenErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        if (state is SigninErrorState) {
          return Opacity(
            opacity: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      state.message,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
