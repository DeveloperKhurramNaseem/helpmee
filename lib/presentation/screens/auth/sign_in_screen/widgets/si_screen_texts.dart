import 'package:flutter/material.dart';

class SIScreenLetsStart extends StatelessWidget {
  const SIScreenLetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome back',
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    );
  }
}

class SIScreenCreateAccount extends StatelessWidget {
  const SIScreenCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign in to your account',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}

class SIScreenErrorText extends StatelessWidget {
  final bool hasError;
  const SIScreenErrorText({super.key, required this.hasError});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: hasError ? 1 : 0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: hasError ? 5.0 : 0.0),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Something went wrong',
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
}
