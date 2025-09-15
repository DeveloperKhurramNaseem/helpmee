import 'package:flutter/material.dart';

class EcText extends StatelessWidget {
  const EcText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Enter Code',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'We have sent a 6 digit code to your email address',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary.withAlpha(150),
            ),
          ),
        ),
      ],
    );
  }
}